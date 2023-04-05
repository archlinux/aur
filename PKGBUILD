# Contributor: Stephen Gregoratto <dev@sgregoratto.me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gmenu
pkgver=0.3.0
pkgrel=3
pkgdesc="desktop application launcher"
url="https://code.rocketnine.space/tslocum/gmenu"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go')
depends=('gtk3' 'at-spi2-core')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f7d610712a228df3472a2eef4f712838cb30ac42a55de7a99f202781da31033c')

build() {
  cd "$pkgname"
  mkdir -p "build"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build ./cmd/...
}

package() {
  install -Dm755 "$pkgname/build/gmenu" "$pkgdir/usr/bin/gmenu"
  install -Dm755 "$pkgname/build/gtkmenu" "$pkgdir/usr/bin/gtkmenu"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
