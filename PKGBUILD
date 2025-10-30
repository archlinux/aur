# Maintainer: Mikhail Golubchikov <golubchikov.mihail@gmail.com>

pkgname=cpp-argparse-dev
pkgver=1.10.0
pkgrel=1
pkgdesc="Python-like argument parser for C++ projects"
arch=('any')
url="https://github.com/rue-ryuzaki/argparse"
license=('MIT')
conflicts=(argparse)
makedepends=(cmake gcc make)
source=("https://github.com/rue-ryuzaki/argparse/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(ee8d084c49e821a063362f01fbbdadf6)

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
