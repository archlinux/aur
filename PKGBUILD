# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.4.0
pkgrel=2
pkgdesc='Monitor a process and trigger a notification'
arch=('x86_64')
url='https://github.com/variadico/noti'
license=('MIT')
makedepends=('go')
source=("https://github.com/variadico/noti/archive/$pkgver.tar.gz")
sha256sums=('8fcf494084ea6eacac2e55dfcaf978452e1af0139205cd23fce71bfb20dd17fe')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname \
    github.com/variadico/noti/cmd/noti
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 noti "$pkgdir/usr/bin/noti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
