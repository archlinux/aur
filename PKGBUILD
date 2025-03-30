# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=3.39.0
pkgrel=1
pkgdesc="A CLI utility to list installed packages with filtering and sorting, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go")
provides=("yaylog")
conflicts=("yaylog-bin" "yaylog-git")
source=("${url}/releases/download/v${pkgver}/yaylog-v${pkgver}.tar.gz")
sha256sums=('c5de22fdb3e7770640ffae937297dbe07b361ceee16b71505f996d89c9beeb88')

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
