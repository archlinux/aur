# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=epic-lore-bin
pkgver=0.9.0
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
sha256sums_x86_64=('05a1890406ff400d265e43c58afef4da2fdcb23642483766eb35bb0d4b904a5a'
                   'd30324ce10f5498a749e6dea65100d01103474a5373cb5db0f270831c967a1d7')
sha256sums_aarch64=('a2568a8f6962d9c9d05db87c462aaaebb1e888536912eaec1cc4cc0289f640e1'
                    '8128f7b581b6a82abbd4a39c4c0a563e7323c31b3f6c3dd26593397cab326260')

package() {
  cd "$srcdir"

  install -Dm755 lore "$pkgdir/usr/bin/lore"
  install -Dm755 loreserver "$pkgdir/usr/bin/loreserver"

  # Systemd service
  install -Dm644 loreserver.service "$pkgdir/usr/lib/systemd/system/loreserver.service"
  install -Dm644 loreserver-sysusers.conf "$pkgdir/usr/lib/sysusers.d/loreserver.conf"
}
