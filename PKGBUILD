# Maintainer: Your Name <youremail@example.com>
pkgname=gflops-bench
pkgver=1.0.2
pkgrel=1
pkgdesc="Brutal-mode multithreaded CPU benchmark reporting GFLOP/s"
arch=('x86_64')
url="https://github.com/CodeDiseaseDev/gflops-bench"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # replace with actual checksum if you want

build() {
  cd "$pkgname-$pkgver"
  rm -rf build        # ensure no old cache
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"
  # Grab binary from wherever it landed
  if [[ -f build/gflops-bench ]]; then
      install -Dm755 build/gflops-bench "$pkgdir/usr/bin/gflops-bench"
  else
      install -Dm755 gflops-bench "$pkgdir/usr/bin/gflops-bench"
  fi
}

