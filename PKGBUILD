# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: zzy-ac <zy-ac@qq.com>
pkgname=bongocat-osu-git
_gitname=bongocat-osu
pkgver=1.5.3
pkgrel=1
epoch=
pkgdesc="An osu! Bongo Cat overlay"
arch=(x86_64)
url="https://github.com/CSaratakij/bongocat-osu"
license=('MIT')
groups=()
depends=('gcc' 'sdl2' 'sfml' 'xorg-xrandr')
makedepends=('git' 'cmake' 'extra-cmake-modules')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"git+${url}.git"
bongocat
bongocat-osu.desktop
)
noextract=()
md5sums=('SKIP'
         '7272510ab9cd539568371ac98073ae2c'
         'eb134c206930a1211ce863dbeeede344')
validpgpkeys=()

build() {
    cd ${_gitname}
    git checkout origin/feature-linux-native-port
    cp Makefile.linux Makefile
    make
    mkdir -p opt/bongocat-osu
    cp -r img opt/bongocat-osu
    cp bin/bongo opt/bongocat-osu/bongocat
}

package() {
install -Dm644 $srcdir/${_gitname}/ico/bongo.ico $pkgdir/usr/share/icons/hicolor/128x128/apps/bongocat.ico
cp -r $srcdir/${_gitname}/opt $pkgdir/opt
install -Dm755 "bongocat" "${pkgdir}/usr/bin/bongocat"
install -Dm644 "bongocat-osu.desktop" "${pkgdir}/usr/share/applications/bongocat-osu.desktop"
}

