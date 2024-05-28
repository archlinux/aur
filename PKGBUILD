# Maintainer: Daniel Otero <otero dot o dot daniel at gmail dot com>
# Maintainer: James Beddek <$(base64 --decode <<<'dGVsYW5zQHBvc3Rlby5kZQo=')>
pkgname=cvise
pkgver=2.10.0
pkgrel=1
pkgdesc="Super-parallel Python port of the C-Reduce"
arch=('x86_64')
url="https://github.com/marxin/cvise"
license=('custom:University of Illinois')
depends=(
    'clang>9.0.0'
    'flex'
    'python-chardet'
    'python-pebble'
    'python-psutil'
    'unifdef'
)
makedepends=(
    'cmake'
    'llvm>9.0.0'
)
checkdepends=('python-pytest')
optdepends=('colordiff')
source=("https://github.com/marxin/cvise/archive/v$pkgver.tar.gz")
sha256sums=('ee9bdfce6f139d0317c98d9c9b51cc68bcaead059de97aac2cf81d71f2215f54')

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
