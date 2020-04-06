# Maintainer: Rouven Himmelstein <rouvenhimmelstein@gmail.com>

_gitname=chwp
_cmdname=chwp
pkgname=${_gitname}-git
pkgver=0.0.27
pkgrel=1
pkgdesc="Changes the background wallpaper and lockscreen from the command line."
arch=('x86_64')
url="https://gitlab.com/rouvenhimmelstein/chwp"
license=('GPL3')
depends=('xorg-xrandr' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-base')
provides=('chwp')
conflicts=('chwp')
source=("https://gitlab.com/rouvenhimmelstein/chwp/-/archive/${pkgver}/${_gitname}-${pkgver}.tar.gz")
sha1sums=('SKIP')

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