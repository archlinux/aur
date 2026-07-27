pkgname=sway-title-animator
pkgver=0.2.2
pkgrel=1
pkgdesc="Animated Unicode titlebars for Sway"
arch=('x86_64' 'aarch64')
url="https://github.com/marang/sway-title-animator"
license=('MIT')
depends=('sway')
optdepends=('libpulse: sound-reactive animation presets via parec')
makedepends=('go>=1.26')
source=("sway-title-animator-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a6e51f9f5e51d8e99a22801d5c08e277da49e4f243d53770f143d94e740b599b')

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
