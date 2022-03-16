pkgname=wirespider
pkgver=0.3.1
pkgrel=1
pkgdesc="Wirespider distributes wireguard tunnel configurations and routes"
arch=('x86_64')
url="https://github.com/SFTtech/wirespider"
license=('GPL3' 'custom')
depends=('gcc-libs' 'wireguard-tools')
makedepends=('cargo' 'rustfmt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SFTtech/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b90b5ebf2e228458ed8b49af48ca31d58e8b3389340de03710bc1632cc8d071d880122e1bdc350cdd569236d27e56255f6323b0e30cb7456d3ff752aa095aeee')

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
