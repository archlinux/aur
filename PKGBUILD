# Maintainer: Maiko Tan <maiko.tan.coding@gmail.com>
pkgname=xc
pkgver=0.8.6
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
sha256sums=('142c28aafa454b461b2950d980f0a8a5d89b59fb9032bbe23ca1015472bff691')

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
