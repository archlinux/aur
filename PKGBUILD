pkgname=may
pkgver=1.1.1
pkgrel=1
pkgdesc='CLI tool to easily list and manage multiple git repositories.'
arch=('x86_64')
url="https://github.com/robin-mbg/$pkgname"
license=('GPL')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('75d731e11085ec6c09fa73bed2bf8dfd9161b6f859f4f600f8cda0de78348974')

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
