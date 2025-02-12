# Maintainer: Daniel Otero <otero dot o dot daniel at gmail dot com>
# Maintainer: James Beddek <$(base64 --decode <<<'dGVsYW5zQHBvc3Rlby5kZQo=')>
pkgname=cvise
pkgver=2.11.0
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
sha256sums=('7e3e473843aa79afb98f581d2e100efa47db80df3a961565b691d7b4a4ebd14b')

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
