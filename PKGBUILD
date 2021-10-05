# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=gmenu
pkgver=0.3.0
pkgrel=1
pkgdesc="desktop application launcher"
url="https://code.rocketnine.space/tslocum/gmenu"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go')
depends=('gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d052a6d209c4521d670a97eb3af813b3f7c18fc4a07154d2f8b387da7d6ff9f7')


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
