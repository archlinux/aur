# Maintainer: maz-1 <loveayawaka@gmail.com>

_pkgname=waifu2x-converter-qt
pkgname=$_pkgname-git
pkgver=26.8707e34
pkgrel=1
pkgdesc="Qt frontend of waifu2x."
arch=('x86_64' 'i686')
url="https://github.com/khws4v1/waifu2x-converter-qt"
license=('GPL2')
depends=('waifu2x' 'qt5-base' 'libnotify')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/khws4v1/waifu2x-converter-qt.git"
        "waifu2x.png"
        "waifu2x-converter-qt.desktop")
md5sums=('SKIP'
            '08f2ccd67e567d0fa9feb53c15b9de46'
            '9fb5356615674e93caa8520e6f3717f5')
_gitname=$_pkgname

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}
prepare() {
        rm -rf ${srcdir}/build
        mkdir ${srcdir}/build
}
build() {
	cd "${srcdir}/build"
	qmake-qt5 ../${_gitname}/waifu2x-converter-qt.pro
	make -j4
}

package() {
	cd "$srcdir/build"
	install -Dm755 waifu2x-converter-qt "${pkgdir}/usr/bin/waifu2x-converter-qt"
	install -Dm755 "$srcdir/waifu2x.png" "${pkgdir}/usr/share/pixmaps/waifu2x.png"
	install -Dm755 "$srcdir/waifu2x-converter-qt.desktop" "${pkgdir}/usr/share/applications/waifu2x-converter-qt.desktop"
}
