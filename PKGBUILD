# Maintainer: Rouven Himmelstein <rouvenhimmelstein@gmail.com>

_gitname=cppsplash
_cmdname=chwp
pkgname=${_gitname}-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Changes the background wallpaper for gnome & cinnamon based desktops from the command line."
arch=('x86_64')
url="https://gitlab.com/rouvenhimmelstein/cppsplash"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'cmake' 'qt5-base')
provides=('chwp')
conflicts=('chwp')
source=("https://gitlab.com/rouvenhimmelstein/cppsplash/-/archive/${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    mkdir -p $srcdir/$_gitname-${pkgver}/cmake-build-release
}


build() {
    cd $srcdir/$_gitname-${pkgver}/cmake-build-release
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd $srcdir/$_gitname-${pkgver}/cmake-build-release
    make DESTDIR="$pkgdir" install

    cd ${srcdir}/${_gitname}-${pkgver}
    install -D -m755 ${_cmdname}.1 ${pkgdir}/usr/share/man/man1/${_cmdname}.1
}