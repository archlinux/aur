# Maintainer: metaneutrons
pkgname=snapdog-client
# _tag is the full published git tag suffix (release core, optionally with a
# prerelease identifier, e.g. "0.27.5-test1"); it names the GitHub release
# assets. pkgver must never carry that suffix or its hyphen (Arch policy), so
# it always holds just the release core.
_tag=0.35.0
pkgver=0.35.0
pkgrel=1
pkgdesc="SnapDog multiroom audio client with F32+LZ4 codec, parametric EQ, and encryption"
arch=('x86_64' 'aarch64')
url="https://github.com/SnapDogRocks/snapdog"
license=('GPL-3.0-only')
depends=('alsa-lib' 'avahi')
backup=('etc/default/snapdog-client')
source=(
  "snapdog-client.service::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog-client/systemd/snapdog-client.service"
  "snapdog-client.default::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog-client/debian/snapdog-client.default"
  "snapdog-client.dbus.conf::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${_tag}/snapdog-client/dbus/snapdog-client.conf"
)
sha256sums=('2230284816739ff4bc27ec66b18992e5fdc3e805347c14b6fbf9d370f713f6f6' 'cfb6929454873362485e6c94b26e4fc73159a209e850a36bcf1f61e892ea0be5' '85de09c7bb9cdd426c3f251066353cd94f31c3010e16e338cd53097163657a2d')
source_x86_64=("snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9c7d8ed49f29fd02a6ebed287583aa5621cd1e39b4a396b35b5d8897244b75a2')
sha256sums_aarch64=('52e68f8d8d9559742bb2d91e74742e5cd98387cec9b81652cc3e42c9661cc8f7')

package() {
  cd "snapdog-v${_tag}-${CARCH}-unknown-linux-gnu"
  install -Dm755 snapdog-client "$pkgdir/usr/bin/snapdog-client"
  install -Dm644 "$srcdir/snapdog-client.service" "$pkgdir/usr/lib/systemd/system/snapdog-client.service"
  install -Dm644 "$srcdir/snapdog-client.default" "$pkgdir/etc/default/snapdog-client"
  install -Dm644 "$srcdir/snapdog-client.dbus.conf" "$pkgdir/usr/share/dbus-1/system.d/snapdog-client.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
