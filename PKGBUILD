pkgname=wirespider
pkgver=0.2.0
pkgrel=1
pkgdesc="Wirespider distributes wireguard tunnel configurations and routes"
arch=('x86_64')
url="https://github.com/SFTtech/wirespider"
license=('GPL3' 'custom')
depends=('gcc-libs' 'wireguard-tools')
makedepends=('cargo' 'rustfmt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SFTtech/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('26ad1529e8859a839f4109595232d68fa9de3cb49b01a83cb22a1edaeb09b2227ae31ef7b54af322acae766909ce68019e4f9fc6b017acc54b64469c37e4f833')

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