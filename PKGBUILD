pkgname=sway-title-animator
pkgver=0.1.9
pkgrel=1
pkgdesc="Animated Unicode titlebars for Sway"
arch=('x86_64' 'aarch64')
url="https://github.com/marang/sway-title-animator"
license=('MIT')
depends=('sway')
makedepends=('go')
source=("sway-title-animator-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d677e7539b747d0bcce63a522a6b5558e82f6943a22c7c2226d873e5f1fdebb')

build() {
  cd "sway-title-animator-$pkgver"
  CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o sway-title-animator ./cmd/sway-title-animator
}

package() {
  cd "sway-title-animator-$pkgver"
  install -Dm755 sway-title-animator "$pkgdir/usr/bin/sway-title-animator"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 contrib/sway/45-title-animator.conf "$pkgdir/usr/share/doc/$pkgname/45-title-animator.conf"
}
