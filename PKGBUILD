# Maintainer: Relish0171 <aur.such581@aleeas.com>
pkgname=untwine
pkgver=1.5.1
pkgrel=2
pkgdesc="Tool for creating Cloud Optimized Point Cloud (COPC) web services from PDAL-readable point cloud data sources."
arch=('x86_64' 'aarch64')
url="https://github.com/hobuinc/untwine"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'pdal')
makedepends=('cmake')
_srcext="${pkgname}-${pkgver}"
source=("${_srcext}.tar.gz::https://github.com/hobuinc/untwine/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('69b5ef26a28c514b1a8459440f32faccc4fb2d3b835aa9733bf4d8c31a5f7022')

build() {
    local cmake_options=(
        -B build
        -S "${_srcext}"
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
