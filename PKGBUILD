# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=fccf
pkgver=0.6.0
pkgrel=1
pkgdesc="fccf: A command-line tool that quickly searches through C/C++ source code in a directory based on a search string and prints relevant code snippets that match the query."
arch=('x86_64')
url="https://github.com/p-ranav/fccf"
license=('MIT')
makedepends=('cmake' 'clang' 'llvm' 'zlib')
depends=('clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('684403084fb2838338e8dc8792e16d85e744a3b7fe0b15765266fb801a25af65')

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build -D CMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/local"
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"
  cmake --install build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

