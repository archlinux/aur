# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gmenu
pkgver='0.3.1'
pkgrel=1
pkgdesc='Desktop application launcher'
url='https://code.rocketnine.space/tslocum/gmenu'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go')
depends=('gtk4' 'libgirepository')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4de2afe3139889c9a686ba853812c5401bc80a7105c7816f7ddfa0e73df3b0ae2ae2cf492e7def05674d64dea3aad6c47f707a29329abcc3c332e341a6b2e632')

build() {
  cd "$pkgname"
  mkdir -p 'build'

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
