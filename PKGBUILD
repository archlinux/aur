# Maintainer: Wiktor Zykubek <dev at wzykubek dot xyz>
pkgname=licensmith
pkgver=1.2.0
pkgrel=1
pkgdesc="Crafting the ideal license for your Git repository in seconds!"
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/wzykubek/licensmith"
license=('ISC')
makedepends=('go>=1.23.4')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wzykubek/licensmith/archive/v${pkgver}.tar.gz")
sha256sums=('c94fd1e569d33223f16e250abe103ab9602150fc10806643457d55574d85a915')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  make VERSION=$pkgver build
  make VERSION=$pkgver completions
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
