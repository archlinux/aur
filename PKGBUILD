# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog-git
pkgver=3.0.0
pkgrel=1
pkgdesc="A CLI utility to list installed packages with filtering and sorting, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go")
provides=("yaylog")
conflicts=("yaylog")
source=("${url}/releases/download/v${pkgver}/yaylog-v${pkgver}.tar.gz")
sha256sums=('97a675919b9f84a8250ca6553a1ac878c9d29b2b3afe7edc05b7e6c1c838c4e5')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -o "$pkgname" ./cmd/$pkgname
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
