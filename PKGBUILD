# Maintainer: Inc44
pkgname=libbsc
pkgver=3.3.12
pkgrel=3
pkgdesc="High-performance block-sorting data compressor"
arch=('x86_64')
url="https://github.com/IlyaGrebnov/libbsc"
license=('Apache-2.0')
makedepends=('git' 'cmake' 'gcc')
optdepends=('openmp' 'cuda')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/libbsc"
  cmake -S . -B build -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/libbsc"
  install -Dm755 "build/bsc" "$pkgdir/usr/bin/bsc"
  install -Dm644 "build/libbsc.a" "$pkgdir/usr/lib/libbsc.a"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
