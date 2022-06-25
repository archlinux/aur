# Maintainer: Mikhail Golubchikov <golubchikov.mihail@gmail.com>

pkgname=cpp-argparse-dev
pkgver=1.6.5
pkgrel=1
pkgdesc="Python-like argument parser for C++ projects"
arch=('any')
url="https://github.com/rue-ryuzaki/argparse"
license=('MIT')
makedepends=(cmake gcc make)
source=("https://github.com/rue-ryuzaki/argparse/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(ab65c1d67f19241fea81bc9eaf74a085)

build() {
    cmake -B build -S "argparse-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    cd build
    ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
