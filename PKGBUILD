# Maintainer: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=pngwriter-git
pkgver=0.5.5.r0.g283c34d
pkgrel=2
pkgdesc="A C++ library for creating PNG images"
url="http://${pkgname%-git}.sourceforge.net/"
source=("${pkgname}::git://github.com/pngwriter/${pkgname%-git}.git")
install=${pkgname}.install
license=('GPL')
arch=('i686' 'x86_64')
depends=('libpng' 'freetype2')
makedepends=('git')
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd ${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
}
