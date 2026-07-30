# Maintainer: hedgeg0d <werstak192@gmail.com>
pkgname=crom
pkgver=0.3.0
pkgrel=2
pkgdesc='Fast parallel file finder by name or content, freestanding, no libc'
arch=('x86_64')
url='https://github.com/hedgeg0d/crom'
license=('MIT')
makedepends=('clang' 'lld' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66d7894240c0e8949a2d19ad7651506b62ea98f2fb6a482871459558dfb82daf')

# AUR builds on the machine that will run it, so tune for this CPU. Set
# _native=0 if the built package will be copied to a different machine.
_native=${_native:-1}

build() {
  cd "$pkgname-$pkgver"
  if [ "$_native" = 1 ]; then
    make ARCH_FLAGS=-march=native
  else
    make ARCH_FLAGS=-march=x86-64-v2
  fi
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
