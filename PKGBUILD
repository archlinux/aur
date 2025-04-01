# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=3.41.0
pkgrel=2
pkgdesc="(DEPRECATED) This package has been renamed to 'qp'. Please install 'qp' instead."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go")
provides=("yaylog")
conflicts=("yaylog-bin" "yaylog-git")
source=("${url}/releases/download/v${pkgver}/yaylog-v${pkgver}.tar.gz")
sha256sums=('9a22c6cf6dd6b27ac919586a70bb055b1c84be3a4b3d0bca9b6ccb434de08427')
install='yaylog.install'

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
