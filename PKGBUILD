# Maintainer: Achno <logiaTemp@proton.me>
pkgname=gowall
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to convert a Wallpaper's color scheme - palette"
arch=('x86_64')
url="https://github.com/Achno/gowall"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Achno/gowall/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')



prepare() {
  cd "$srcdir"

  # give perms so ~/.cache/yay/gowall/go/pkg/mod/ ... can be deleted
  mkdir -p "$srcdir/go/pkg/mod"
  chmod -R u+rw "$srcdir/go/pkg/mod"
}

build() {

  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/go"

  go build -o gowall

}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gowall "$pkgdir/usr/bin/gowall"
}
