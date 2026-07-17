# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=epic-lore-bin
pkgver=0.8.5
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
sha256sums_x86_64=('3d58bd36caaec2e9916489ec7e4fc7195a858e51cb71a3b6e90d72adfe3062ff'
                   'e14eeaca47aef92a65f70a1112507f9651e5459d9c6a34be2a41ba8043e89b30')
sha256sums_aarch64=('c6fc47d0fa0706f8d979d039a665bc7fb5ed7a8a23e9e69abcd9cab052781134'
                    '02a0e47c672748136b2467efe65961685f5cfb7a341dae0115e0564e3a6ec91d')

package() {
  cd "$srcdir"

  install -Dm755 lore "$pkgdir/usr/bin/lore"
  install -Dm755 loreserver "$pkgdir/usr/bin/loreserver"

  # Systemd service
  install -Dm644 loreserver.service "$pkgdir/usr/lib/systemd/system/loreserver.service"
  install -Dm644 loreserver-sysusers.conf "$pkgdir/usr/lib/sysusers.d/loreserver.conf"
}
