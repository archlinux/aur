# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=epic-lore-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Epic Games Lore version control system (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/EpicGames/lore'
license=('MIT')
depends=('gcc-libs')
options=(!strip)
conflicts=('lore' 'lore-bin' 'lore-cli-bin')
provides=('lore')
install='loreserver.install'

source=("loreserver.service" "loreserver-sysusers.conf" "loreserver.install")
source_x86_64=(
  "lore-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/lore-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
  "loreserver-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/loreserver-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
  "lore-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/lore-v$pkgver-aarch64-unknown-linux-gnu-neoverse-512tvb.tar.gz"
  "loreserver-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/loreserver-v$pkgver-aarch64-unknown-linux-gnu-neoverse-512tvb.tar.gz"
)

sha256sums=('1e719ba96030560ebb8f23fa7f18d15c9e94b230d5cd451e9c0edc027113499c'
            'd6899f04359ee944316aaa6336cbede36824364724c4b987e5dec744a3c8e398'
            '731ff6b7b872fcb5ab22f7d07038762cdae8f1786ff590b785f4dee9fdf4f066')
sha256sums_x86_64=('52c85efbe6535ae0a82f5ae7fcc5b5d7e9f91378219f1d5b35c14a82b7870b91'
                   '0c7fb344ec44701ee63702c4eda67853d6b141cde44be482f52a8a490e6902b3')
sha256sums_aarch64=('424195fe0bfc3270ccc7c048911524ab30be04dcbee6680e75af30436eff3238'
                    '6c823d30bfb7bc53177826d1a5c348a2ce1eef77cce033e763f77ca24b9077e1')

package() {
  cd "$srcdir"

  install -Dm755 lore "$pkgdir/usr/bin/lore"
  install -Dm755 loreserver "$pkgdir/usr/bin/loreserver"

  # Systemd service
  install -Dm644 loreserver.service "$pkgdir/usr/lib/systemd/system/loreserver.service"
  install -Dm644 loreserver-sysusers.conf "$pkgdir/usr/lib/sysusers.d/loreserver.conf"
}
