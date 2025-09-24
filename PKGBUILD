# Maintainer: Daniel Otero <otero dot o dot daniel at gmail dot com>
# Maintainer: James Beddek <$(base64 --decode <<<'dGVsYW5zQHBvc3Rlby5kZQo=')>
pkgname=cvise
pkgver=2.12.0
pkgrel=2
pkgdesc="Super-parallel Python port of the C-Reduce"
arch=('x86_64')
url="https://github.com/marxin/cvise"
license=('custom:University of Illinois')
depends=(
    'clang'
    'flex'
    'python-chardet'
    'python-pebble'
    'python-psutil'
    'unifdef'
)
makedepends=(
    'cmake'
    'llvm'
)
checkdepends=('python-pytest')
optdepends=('colordiff')
source=("https://github.com/marxin/cvise/archive/v$pkgver.tar.gz")
sha256sums=('7eb3b2ec4e64e3033cb47e35363336f50b1313a34a106609ad1110c532389779')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DCMAKE_INSTALL_LIBEXECDIR='/usr/lib' \
      -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
