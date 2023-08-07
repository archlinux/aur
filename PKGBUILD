# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.7.0
pkgrel=1
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

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 noti "$pkgdir/usr/bin/noti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
