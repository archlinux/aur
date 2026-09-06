# Maintainer: metaneutrons
pkgname=snapdog
pkgver=0.27.4
pkgrel=1
pkgdesc="Multi-room audio system with AirPlay, Snapcast, MQTT, and KNX integration"
arch=('x86_64' 'aarch64')
url="https://github.com/SnapDogRocks/snapdog"
license=('GPL-3.0-only')
depends=('alsa-lib' 'avahi' 'openssl')
backup=('etc/snapdog/snapdog.toml' 'etc/default/snapdog')
source=(
  "snapdog.service::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${pkgver}/snapdog/systemd/snapdog.service"
  "snapdog.default::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${pkgver}/snapdog/debian/snapdog.default"
  "snapdog.example.toml::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${pkgver}/snapdog.example.toml"
)
sha256sums=('6f96d42a6a1deef15ce98af7581665c9740c0fc4f3ad447a9a3fcb828d356c28' 'c21a13544a55cc6b28501679192715d17020ed7e0a90988600878846e1f5013a' '58f36746d40c0649036846cd46b03e6aabb14841f770b6159c5fbfd51e22a69d')
source_x86_64=("snapdog-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${pkgver}/snapdog-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("snapdog-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${pkgver}/snapdog-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('930522f2c6cd23ef269bfa33eb1fa2bf96fa79d56630280d49b36933381e9a42')
sha256sums_aarch64=('b8401893d0d9a001ed824306612c67efa8e8fcee11588ba5b710c96ed976462f')

package() {
  cd "snapdog-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 snapdog "$pkgdir/usr/bin/snapdog"
  install -Dm644 "$srcdir/snapdog.service" "$pkgdir/usr/lib/systemd/system/snapdog.service"
  install -Dm644 "$srcdir/snapdog.default" "$pkgdir/etc/default/snapdog"
  install -Dm644 "$srcdir/snapdog.example.toml" "$pkgdir/etc/snapdog/snapdog.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
