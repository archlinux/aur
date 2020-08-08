# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=baloo-widgets-git
pkgver=20.04.1.r16.gc4990a7
pkgrel=1
pkgdesc='Widgets for Baloo (Git)'
arch=(i686 x86_64)
url='https://community.kde.org/Baloo'
license=(LGPL)
depends=(baloo)
makedepends=(extra-cmake-modules git kdoctools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://invent.kde.org/libraries/baloo-widgets.git)
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname%-git}" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
