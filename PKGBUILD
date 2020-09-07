# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.5.0
pkgrel=1
pkgdesc='Monitor a process and trigger a notification'
arch=('x86_64')
url='https://github.com/variadico/noti'
license=('MIT')
makedepends=('go')
source=("https://github.com/variadico/noti/archive/$pkgver.tar.gz")
sha256sums=('04183106921e3a6aa7c107c6dff6fa13273436e8a26d139e49f34c5d1eea348c')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    -o $pkgname \
    github.com/variadico/noti/cmd/noti
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 noti "$pkgdir/usr/bin/noti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
