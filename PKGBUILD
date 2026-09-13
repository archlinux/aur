# Maintainer: metaneutrons
pkgname=snapdog
# _tag is the full published git tag suffix (release core, optionally with a
# prerelease identifier, e.g. "0.27.5-test1"); it names the GitHub release
# assets. pkgver must never carry that suffix or its hyphen (Arch policy), so
# it always holds just the release core.
_tag=0.27.8
pkgver=0.27.8
pkgrel=1
pkgdesc="Multi-room audio system with AirPlay, Snapcast, MQTT, and KNX integration"
arch=('x86_64' 'aarch64')
url="https://github.com/SnapDogRocks/snapdog"
license=('GPL-3.0-only')
depends=('alsa-lib' 'avahi' 'openssl')
backup=('etc/snapdog/snapdog.toml' 'etc/default/snapdog')
source=(
  "snapdog.service::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog/systemd/snapdog.service"
  "snapdog.default::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog/debian/snapdog.default"
  "snapdog.example.toml::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog.example.toml"
)
sha256sums=('6f96d42a6a1deef15ce98af7581665c9740c0fc4f3ad447a9a3fcb828d356c28' 'c21a13544a55cc6b28501679192715d17020ed7e0a90988600878846e1f5013a' '58f36746d40c0649036846cd46b03e6aabb14841f770b6159c5fbfd51e22a69d')
source_x86_64=("snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a24c913338b6c91056d8217f4179607ba52867039365b032a242081b31cdbe60')
sha256sums_aarch64=('2e596b33316b4be0687b6d96729e6ca2a82e1d5f7199c4a2b10778c598e67b00')

package() {
  cd "snapdog-v${_tag}-${CARCH}-unknown-linux-gnu"
  install -Dm755 snapdog "$pkgdir/usr/bin/snapdog"
  install -Dm644 "$srcdir/snapdog.service" "$pkgdir/usr/lib/systemd/system/snapdog.service"
  install -Dm644 "$srcdir/snapdog.default" "$pkgdir/etc/default/snapdog"
  install -Dm644 "$srcdir/snapdog.example.toml" "$pkgdir/etc/snapdog/snapdog.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
