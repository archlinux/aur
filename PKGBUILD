# Maintainer: hedgeg0d <werstak192@gmail.com>
pkgname=crom
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast parallel file finder by name or content, freestanding, no libc'
arch=('x86_64')
url='https://github.com/hedgeg0d/crom'
license=('MIT')
makedepends=('clang' 'lld' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e12fe0cdde1be615f2a22e0d814ff274213ea70cf6120aa0a68422d30ffc524')

build() {
  cd "$pkgname-$pkgver"
  # -march=native would tie the package to the build machine
  make ARCH_FLAGS=-march=x86-64-v2
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
