# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=gmenu
pkgver=0.2.6
pkgrel=1
pkgdesc="desktop application launcher"
_url="https://gitlab.com/tslocum/gmenu"
url="${_url}.git"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'gtk3')
source=("$_url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('901f3b6f60f1aa1ccf7af4ea06fa899f152d7805f6799f73d1280993072988db')

build() {
  cd "$pkgname-v$pkgver"
  for cmd in "gmenu" "gtkmenu"; do
    go build \
      -trimpath \
      -ldflags "-extldflags ${LDFLAGS}" \
      -v -o "$cmd" "./cmd/$cmd"
  done
}

package() {
  install -Dm755 "$pkgname-v$pkgver/gmenu"   "$pkgdir/usr/bin/gmenu"
  install -Dm755 "$pkgname-v$pkgver/gtkmenu" "$pkgdir/usr/bin/gtkmenu"
  install -Dm644 "$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
