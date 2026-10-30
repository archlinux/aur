# Maintainer: metaneutrons
pkgname=snapdog-client
# _tag is the full published git tag suffix (release core, optionally with a
# prerelease identifier, e.g. "0.27.5-test1"); it names the GitHub release
# assets. pkgver must never carry that suffix or its hyphen (Arch policy), so
# it always holds just the release core.
_tag=0.29.0
pkgver=0.29.0
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
sha256sums_x86_64=('2e259ecb1f07d2f9efe7bcdb177b1236d0126b81f50a154b3b8546f856da9eef')
sha256sums_aarch64=('8cfac758c14dd05c686a88a8c4b5ca5345a12636dbfea38825dae08b3d826fa4')

package() {
  cd "snapdog-v${_tag}-${CARCH}-unknown-linux-gnu"
  install -Dm755 snapdog-client "$pkgdir/usr/bin/snapdog-client"
  install -Dm644 "$srcdir/snapdog-client.service" "$pkgdir/usr/lib/systemd/system/snapdog-client.service"
  install -Dm644 "$srcdir/snapdog-client.default" "$pkgdir/etc/default/snapdog-client"
  install -Dm644 "$srcdir/snapdog-client.dbus.conf" "$pkgdir/usr/share/dbus-1/system.d/snapdog-client.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
