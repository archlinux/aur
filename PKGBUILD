pkgname=wirespider
pkgver=0.3.0
pkgrel=1
pkgdesc="Wirespider distributes wireguard tunnel configurations and routes"
arch=('x86_64')
url="https://github.com/SFTtech/wirespider"
license=('GPL3' 'custom')
depends=('gcc-libs' 'wireguard-tools')
makedepends=('cargo' 'rustfmt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SFTtech/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('1ad7d8a9b11bff37c995275cfaf5983eecc593f44392e5372735c8b5c6d6940d0f5409dba62d3d60cb984a87887f929b6b4f01b743396d335d2dca0f77c79810')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"

  cargo test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/wirespider" "$pkgdir/usr/bin/wirespider"

  install -Dm644 "systemd/system/wirespider-server.service" "$pkgdir/usr/lib/systemd/system/wirespider-server.service"
  install -Dm644 "systemd/system/wirespider-server.service" "$pkgdir/usr/lib/systemd/system/wirespider-server.service"
  install -Dm644 "systemd/wirespider/wg0" "$pkgdir/etc/wirespider/example-wg0"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
