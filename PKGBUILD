# Maintainer: Daniel Otero <otero dot o dot daniel at gmail dot com>
# Maintainer: James Beddek <$(base64 --decode <<<'dGVsYW5zQHBvc3Rlby5kZQo=')>
pkgname=cvise
pkgver=2.8.0
pkgrel=1
pkgdesc="Super-parallel Python port of the C-Reduce"
arch=('x86_64')
url="https://github.com/marxin/cvise"
license=('custom:University of Illinois')
depends=(
    'clang>9.0.0'
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
sha256sums=('cb0bd15885b18b4e79be216c6ca7bed546defc0e9b533d6103868580c690a1a1')

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
