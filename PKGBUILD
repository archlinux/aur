# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=epic-lore-bin
pkgver=0.12.0
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
sha256sums_x86_64=('27c312c4e3ddce160bbbce7356fba5698fdecead049bf4b4c704174c3d9a8f28'
                   '9372eb024ff571063b8b783dc99281fed7d73c96e234770266736873443d773a')
sha256sums_aarch64=('4f095f2fd880a7530a215977669c06b41dc367f85b82712102cde04bfdb471d6'
                    '940777fc84c0959ddaa6be9a1e93fdf28eee2e009828a77048e4cc3ca783d35e')

package() {
  cd "$srcdir"

  install -Dm755 lore "$pkgdir/usr/bin/lore"
  install -Dm755 loreserver "$pkgdir/usr/bin/loreserver"

  # Systemd service
  install -Dm644 loreserver.service "$pkgdir/usr/lib/systemd/system/loreserver.service"
  install -Dm644 loreserver-sysusers.conf "$pkgdir/usr/lib/sysusers.d/loreserver.conf"
}
