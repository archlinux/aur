# Maintainer: metaneutrons
pkgname=snapdog-client
# _tag is the full published git tag suffix (release core, optionally with a
# prerelease identifier, e.g. "0.27.5-test1"); it names the GitHub release
# assets. pkgver must never carry that suffix or its hyphen (Arch policy), so
# it always holds just the release core.
_tag=0.27.6
pkgver=0.27.6
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
)
sha256sums=('2230284816739ff4bc27ec66b18992e5fdc3e805347c14b6fbf9d370f713f6f6' 'e7f1d97793d9c67c1c019a89661dc87a539c6c5ae30fb46f5f5828beb53749e6')
source_x86_64=("snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${_tag}/snapdog-v${_tag}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9e528337a92672851e3e4ea6d60dc1b4c8c362c6a75d26dff0c8dba931b0c263')
sha256sums_aarch64=('ccfa87f8c76127fc85c12f11dd2cee6e267738cd23c3a87e313478585b60778e')

package() {
  cd "snapdog-v${_tag}-${CARCH}-unknown-linux-gnu"
  install -Dm755 snapdog-client "$pkgdir/usr/bin/snapdog-client"
  install -Dm644 "$srcdir/snapdog-client.service" "$pkgdir/usr/lib/systemd/system/snapdog-client.service"
  install -Dm644 "$srcdir/snapdog-client.default" "$pkgdir/etc/default/snapdog-client"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
