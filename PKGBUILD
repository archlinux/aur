# Maintainer: hedgeg0d <werstak192@gmail.com>
pkgname=crom
pkgver=0.3.1
pkgrel=1
pkgdesc='Fast parallel file finder by name or content, freestanding, no libc'
arch=('x86_64')
url='https://github.com/hedgeg0d/crom'
license=('MIT')
makedepends=('python')   # gcc and make come from base-devel
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96c712ffccab12e07d321b57fb9e8e28f971ee4b5cf6e5afacef94fdf5eb8b55')

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
