# Maintainer: metaneutrons
pkgname=snapdog-client
pkgver=0.27.4
pkgrel=1
pkgdesc="SnapDog multiroom audio client with F32+LZ4 codec, parametric EQ, and encryption"
arch=('x86_64' 'aarch64')
url="https://github.com/SnapDogRocks/snapdog"
license=('GPL-3.0-only')
depends=('alsa-lib' 'avahi')
backup=('etc/default/snapdog-client')
source=(
  "snapdog-client.service::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${pkgver}/snapdog-client/systemd/snapdog-client.service"
  "snapdog-client.default::https://raw.githubusercontent.com/SnapDogRocks/snapdog/v${pkgver}/snapdog-client/debian/snapdog-client.default"
)
sha256sums=('2230284816739ff4bc27ec66b18992e5fdc3e805347c14b6fbf9d370f713f6f6' 'e7f1d97793d9c67c1c019a89661dc87a539c6c5ae30fb46f5f5828beb53749e6')
source_x86_64=("snapdog-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${pkgver}/snapdog-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("snapdog-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/SnapDogRocks/snapdog/releases/download/v${pkgver}/snapdog-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('930522f2c6cd23ef269bfa33eb1fa2bf96fa79d56630280d49b36933381e9a42')
sha256sums_aarch64=('b8401893d0d9a001ed824306612c67efa8e8fcee11588ba5b710c96ed976462f')

package() {
  cd "snapdog-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 snapdog-client "$pkgdir/usr/bin/snapdog-client"
  install -Dm644 "$srcdir/snapdog-client.service" "$pkgdir/usr/lib/systemd/system/snapdog-client.service"
  install -Dm644 "$srcdir/snapdog-client.default" "$pkgdir/etc/default/snapdog-client"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
