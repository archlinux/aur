pkgname=may
pkgver=1.1.0
pkgrel=1
pkgdesc='CLI tool to easily list and manage git repositories all across your system.'
arch=('x86_64')
url="https://github.com/robin-mbg/$pkgname"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1139f257fdc6bb61ada221081186ad59b4e1d90c700eec70468141774e706614')

build() {
  cd $pkgname-$pkgver
  go mod vendor
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname ./cmd/may
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
