# Maintainer: metaneutrons
pkgname=snapdog
# _tag is the full published git tag suffix (release core, optionally with a
# prerelease identifier, e.g. "0.27.5-test1"); it names the GitHub release
# assets. pkgver must never carry that suffix or its hyphen (Arch policy), so
# it always holds just the release core.
_tag=0.29.1
pkgver=0.29.1
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
  "snapdog.toml::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog/debian/snapdog.toml"
  "snapdog.dbus.conf::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog/dbus/snapdog.conf"
)
sha256sums=('bb0aeed707da05f35e7f089f00946f8c1ab70d8e3ce36a2eeff87bb51407ceac' 'c21a13544a55cc6b28501679192715d17020ed7e0a90988600878846e1f5013a' '1e2b2079983c75ce2504bab78f23c628b2f1a5de3bece33ebb652e350093e340' '28e4684b452b4be45026ce333721e5992757280f20dd1e643a2c4d8b76672df5')
source_x86_64=("snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('aee62bd68d44cfd9affb1242f2a6ae7e750515a4bb31b4a3781f2fc9c16e983b')
sha256sums_aarch64=('2cef38e648aef0a0983182e0fc3a644868a8a0a382554d5387e02fe2a006bc38')

package() {
  cd "snapdog-v${_tag}-${CARCH}-unknown-linux-gnu"
  install -Dm755 snapdog "$pkgdir/usr/bin/snapdog"
  install -Dm644 "$srcdir/snapdog.service" "$pkgdir/usr/lib/systemd/system/snapdog.service"
  install -Dm644 "$srcdir/snapdog.default" "$pkgdir/etc/default/snapdog"
  install -Dm644 "$srcdir/snapdog.toml" "$pkgdir/etc/snapdog/snapdog.toml"
  install -Dm644 "$srcdir/snapdog.dbus.conf" "$pkgdir/usr/share/dbus-1/system.d/snapdog.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
