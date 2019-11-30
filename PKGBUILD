# Maintainer: Stephen Gregoratto <dev at sgregoratto dot me>
pkgname=gmenu
pkgver=0.2.4
pkgrel=1
pkgdesc="desktop application launcher"
url="https://git.sr.ht/~tslocum/gmenu"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'gtk3')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('9a770da4076e20e58347358baa09487405ca62fc50e586a93a58e362b53170c3')

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
