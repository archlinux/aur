# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=3.7.0
pkgrel=1
pkgdesc="A CLI utility to list installed packages with filtering and sorting, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go")
provides=("yaylog")
conflicts=("yaylog-bin" "yaylog-git")
source=("${url}/releases/download/v${pkgver}/yaylog-v${pkgver}.tar.gz")
sha256sums=('a6f1339d5d5835d13fdd6d914de754eb5dc0eed33b354b03edd32c3f61b99d7b')

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
