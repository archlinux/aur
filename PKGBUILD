# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp
pkgver=4.1.4
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1")
conflicts=("qp-bin" "qp-git")
replaces=("yaylog' 'yaylog-bin' 'yaylog-git")
source=("${url}/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz")
sha256sums=('4acc8712abbf5100b7c85bac32fc379b5808f3e756c95dc8fdc8be7d7fb3cbfb')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -o "$pkgname" ./cmd/$pkgname
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "NEWS" "$pkgdir/usr/share/doc/${pkgname}/NEWS"
}
