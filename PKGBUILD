# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=qp
pkgver=4.0.0
pkgrel=1
pkgdesc="qp - Query Packages. A CLI utility for querying installed packages, written in Go."
arch=("any")
url="https://github.com/Zweih/qp"
license=("GPL3")
makedepends=("go>=1.24.1")
provides=("qp")
conflicts=("qp-bin" "qp-git")
replaces=("yaylog")
source=("${url}/releases/download/v${pkgver}/qp-v${pkgver}.tar.gz")
sha256sums=('062f2315b42f6872a07ca5de1bb4970eb825f4e86d3c232c8a7490ae622fe7e9')

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
