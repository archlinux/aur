# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=epic-lore-bin
pkgver=0.8.6
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
sha256sums_x86_64=('a7aaeb32a15f6674a328e19096c48dcab5b29b283ba51d37abdadedd930812ad'
                   'f0de84c6175a476f157754f57316be0346105be502c93fabb65bb908eab0e1e1')
sha256sums_aarch64=('c07d8c21920ce36277eda49bfef22ed2e8a2ea20b569ddff165b5afe8cad1510'
                    '01a9abf87643c46c10d9fd7d31bb3c91f371b4b66d66c39df838604ce4e9c151')

package() {
  cd "$srcdir"

  install -Dm755 lore "$pkgdir/usr/bin/lore"
  install -Dm755 loreserver "$pkgdir/usr/bin/loreserver"

  # Systemd service
  install -Dm644 loreserver.service "$pkgdir/usr/lib/systemd/system/loreserver.service"
  install -Dm644 loreserver-sysusers.conf "$pkgdir/usr/lib/sysusers.d/loreserver.conf"
}
