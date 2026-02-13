# Maintainer: Maiko Tan <maiko.tan.coding@gmail.com>
pkgname=xc
pkgver=0.9.0
pkgrel=1
pkgdesc="Markdown defined task runner."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/joerdav/xc"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('xc')
conflicts=('xc-bin' 'xc-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joerdav/xc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afcb5e1fbd1be5f0b6dcb802e02c96527ac0e96ddeb47471b8ad4056f91ccc72')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o xc ./cmd/xc
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/xc" "$pkgdir/usr/bin/xc"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
