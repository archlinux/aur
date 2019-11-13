# Maintainer: Stephen Gregoratto <dev at sgregoratto dot me>
pkgname=gmenu
pkgver=0.2.3
pkgrel=1
pkgdesc="desktop application launcher"
url="https://git.sr.ht/~tslocum/gmenu"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'gtk3')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6f2ff530a8aa664bf835d84607396bab12509e6c2dd38e78f525b9a6215a068e')

build() {
  cd "$pkgname-v$pkgver"
  for cmd in "gmenu" "gtkmenu"; do
    go build \
      -trimpath \
      -ldflags "-extldflags ${LDFLAGS}" \
      -v -o "gmenu" ./cmd/$cmd
  done
}

package() {
  install -Dm755 "$pkgname-v$pkgver/gmenu"   "$pkgdir/usr/bin/gmenu"
  install -Dm755 "$pkgname-v$pkgver/gtkmenu" "$pkgdir/usr/bin/gtkmenu"
  install -Dm755 "$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
