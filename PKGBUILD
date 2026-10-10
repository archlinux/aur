# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=libvisio2svg
pkgver=0.5.8
pkgrel=1
pkgdesc="VSS/VSD (Visio Stencil/Drawing) to SVG conversion library"
arch=('x86_64')
url="https://github.com/kakwa/libvisio2svg"
license=('GPL-2.0-or-later')
depends=('librevenge' 'libvisio' 'libemf2svg' 'libxml2' 'libwmf')
makedepends=('cmake')
provides=("libVisio2Svg.so=$pkgver" "libTitleGenerator.so=$pkgver")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0316f079d2c656ab3de1caed3ff82600d767e6e2bd70cc45f57f0e9c4e8bbbf37e02e837fa7aefedabfb13b52042a03997cf9d52ea583dc767827ab2652ced1f')

build() {
    local cmake_options=(
        -B build
        -S "$pkgname-$pkgver"
        -Wno-author
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
