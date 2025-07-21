# Maintainer: Novadragon <me@novadragon.space>
# Contributor: DragonWoven
pkgname="godots-git"
pkgver=1.3.stable.r38.gdbb263b
pkgrel=1
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=("MIT")
arch=("x86_64")
provides=('godots' )
conflicts=('godots' 'godots-bin')
replaces=()
depends=('unzip')
source=("git+https://github.com/MakovWait/godots.git")
makedepends=('git' 'godot=4.4.1' 'godot-export-templates-linux=4.4.1')
b2sums=()
options=("!strip")
sha256sums=('SKIP' )
pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
 mkdir -p "godot-data"
 cp -r "/usr/share/godot" "godot-data"
}

build(){
 cd "${pkgname%-git}"

 mkdir build
 rm -R tests
 XDG_DATA_HOME="$srcdir/godot-data" godot --headless --export-release "Linux/X11" build/godots

}

package(){
 install -Dm644 "${pkgname%-git}/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
 install -Dm644 "${pkgname%-git}/packaging/linux/io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
 install -Dm755  "${pkgname%-git}/build/godots"  "$pkgdir/usr/bin/godots"
}
