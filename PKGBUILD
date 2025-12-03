# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=libvisio2svg
pkgver=0.5.6
pkgrel=1
pkgdesc="VSS/VSD (Visio Stencil/Drawing) to SVG conversion library"
arch=('x86_64')
url="https://github.com/kakwa/libvisio2svg"
license=('GPL-2.0-or-later')
depends=('librevenge' 'libvisio' 'libemf2svg' 'libxml2' 'libwmf')
makedepends=('cmake')
provides=("libVisio2Svg.so=$pkgver" "libTitleGenerator.so=$pkgver")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2a199a7eac038ca24c56e8a549ce264e657fcf6a80c50ff7c5a6ea8c63c7285e87e40c1db49bb377a158776e14eb403aa23984b0c2a51c8f55a2a40ca984f099')

build() {
    local cmake_options=(
        -B build
        -S "$pkgname-$pkgver"
        -Wno-dev
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
