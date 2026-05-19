pkgname=sniffercommit
pkgver=0.2.1
pkgrel=2
pkgdesc="Fast C++20-powered pre-commit hook and CI generator"
arch=('x86_64')
url="https://github.com/slowy07/sniffercommit"
license=('MIT')

depends=(
  'git'
  'bash'
  'fmt'
  'tomlplusplus'
)

makedepends=(
  'cmake'
)

source=(
  "$pkgname-$pkgver.tar.gz"::$url/archive/refs/tags/v$pkgver.tar.gz
)

sha256sums=('SKIP')

build() {
  cmake -B build \
    -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DSNIFFERCOMMIT_USER_SYSTEM_DEPS=ON

  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
