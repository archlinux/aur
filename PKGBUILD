pkgname=may
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI tool to easily list and manage git repositories all across your system.'
arch=('x86_64')
url="https://github.com/robin-mbg/$pkgname"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('48fc67a805add03bca8af263f62e72c6a4e6d989d635faa00f3d1c93f4fd8c9c')

build() {
  cd $pkgname-$pkgver
  go mod vendor
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname ./cmd/may
}

check() {
  cd $pkgname-$pkgver
  may -V
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
