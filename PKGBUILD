# Maintainer: Boothwhack <boothwhack at gmail dot com>
pkgname=skyr-url
pkgver=1.13.0
pkgrel=1
pkgdesc="A C++ library that implements the URL WhatWG specification"
arch=("i686" "x86_64")
url="https://github.com/cpp-netlib/url"
license=("Boost")
depends=("tl-expected" "range-v3" "nlohmann-json")
makedepends=("cmake>=3.16.0" "git")
source=("https://github.com/cpp-netlib/url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("0c9e594f09a9abda5815b07b548ac520b2fc1044fc74b589fc4c5bd18ea4330c")

prepare() {
    cd "${srcdir}/url-${pkgver}"
    rm -rf build && mkdir build
}

build() {
    cd "${srcdir}/url-${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Dskyr_BUILD_TESTS=OFF
    make
}

package() {
    cd "${srcdir}/url-${pkgver}/build"

    make DESTDIR="$pkgdir/" install
}