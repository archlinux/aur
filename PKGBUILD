# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.7.0
pkgrel=2
pkgdesc='Monitor a process and trigger a notification'
arch=('x86_64')
url='https://github.com/variadico/noti'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/variadico/noti/archive/$pkgver.tar.gz")
sha256sums=('f970a4dd242e6b58edf51320aa237bb20d689bbc8fd0f7d0db5aa1980a2dc269')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $pkgname \
    github.com/variadico/noti/cmd/noti
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 noti -t "$pkgdir/usr/bin/"
  install -Dm644 "docs/man/dist/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "docs/man/dist/$pkgname.yaml.5" -t "$pkgdir/usr/share/man/man5/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
