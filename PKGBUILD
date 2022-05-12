# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-git
_pkgname=ferium
pkgver=3.28.7.r0.ge3b52f0
pkgrel=1
pkgdesc="Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases."
arch=("x86_64")
depends=("gcc-libs")
makedepends=("cargo" "just")
provides=("ferium")
conflicts=("ferium-gui-bin" "ferium-bin")
url="https://github.com/theRookieCoder/ferium"
license=('MPL2')
source=('git+https://github.com/theRookieCoder/ferium'
	"ferium.desktop")
sha256sums=('SKIP'
            '594cdfb846ab9cbac0fd781a445501ebb1e3f491fd21202bf3733b00f2151018')
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build(){
    cd "$srcdir/ferium"
    just build-linux-nogui
}
package() {
	cd "$srcdir/ferium/out"
	unzip -o ferium-linux-gnu-nogui.zip
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium" 

	install -Dm644 -t "$pkgdir/usr/share/applications" "../../../ferium.desktop"
}
