# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=epic-lore-bin
pkgver=0.8.3
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

sha256sums=('85dc035cb5308f28b60fe84ba9814a037a88116855699893ba3b0cea475669de'
            'd6899f04359ee944316aaa6336cbede36824364724c4b987e5dec744a3c8e398'
            'da618618c97a72f4b21bff3e836b64e05f3ec3b77f53378f636086f3ffa95850')
sha256sums_x86_64=('55eb9e6d334c3c8d099e281931d4594a13dbda401e4cd202fa9f3114c512b299'
                   'c46d34e6e7b5d1ee00c7fac81f7bbe15918bd7740be21ef2e101631d0dc2dedd')
sha256sums_aarch64=('72ebd59fb365ab1aeb2f0c080a488dbbaf05e6626691dee850c01474235b0a59'
                    'bf14e77c95760608b3a5c72f7763b9211ee3e3c35dca6c83b58c62156a9715a2')

package() {
  install -Dm755 lore "$pkgdir/usr/bin/lore"
  install -Dm755 loreserver "$pkgdir/usr/bin/loreserver"

  # Systemd service
  install -Dm644 loreserver.service "$pkgdir/usr/lib/systemd/system/loreserver.service"
  install -Dm644 loreserver-sysusers.conf "$pkgdir/usr/lib/sysusers.d/loreserver.conf"
}
