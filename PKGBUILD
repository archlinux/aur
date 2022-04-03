pkgname=wirespider
pkgver=0.4.2
pkgrel=1
pkgdesc="Wirespider distributes wireguard tunnel configurations and routes"
arch=('x86_64')
url="https://github.com/SFTtech/wirespider"
license=('GPL3' 'custom')
depends=('gcc-libs' 'wireguard-tools' 'iproute2')
makedepends=('cargo' 'rustfmt' 'cmake' 'gcc' 'protobuf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SFTtech/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fdbfd028da0ae7a891ae18868946c3bd6819840c6ea6ed7e4c57d47018c67465d075c4e74af346c70401304f2b35251b3b2c919a56d2c0461e9091d594524b8b')

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
  install -Dm644 "completions/_wirespider" "$pkgdir/usr/share/zsh/site-functions/_wirespider"
  install -Dm644 "completions/wirespider.bash" "$pkgdir/usr/share/bash-completion/completions/wirespider"
  install -Dm644 "systemd/wirespider/wg0" "$pkgdir/etc/wirespider/example-wg0"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
