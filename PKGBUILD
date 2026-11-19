# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=testsweeper
pkgver=2025.05.28
pkgrel=1
pkgdesc="C++ testing framework for parameter sweeps"
arch=('x86_64')
url="https://github.com/icl-utk-edu/$pkgname"
license=('BSD-3-Clause')
depends=('glibc'
         'libgcc'
         'libgomp'
         'libstdc++')
makedepends=('cmake')
checkdepends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f2b5f185c35f164879eac2a7cdbe57c92a0affeecfe1e3185056c10a861462d')

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -Dbuild_tests=ON -Dcolor=ON -Duse_openmp=ON -Dtestsweeper_install=ON -Wno-dev
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver/build/test"
  python run_tests.py
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
