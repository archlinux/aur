# Maintainer: 0x90shell
pkgname=gamepad-osk-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Gamepad-controlled on-screen keyboard for Linux"
arch=('x86_64')
url="https://github.com/0x90shell/gamepad-osk"
license=('MIT')
depends=('sdl3' 'sdl3_ttf' 'wayland' 'libx11' 'ttf-promptfont')
provides=('gamepad-osk')
conflicts=('gamepad-osk' 'gamepad-osk-git')
install=gamepad-osk-bin.install
source=("gamepad-osk-${pkgver}.bin::${url}/releases/download/v${pkgver}/gamepad-osk"
        "${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4bc9b0f4fbb73da1c67a06cdbc08ef7300a2031b2d5e2a3d70e007490db7c1cc'
            '9b4082f2abe8a13adbbfd7c7079b227b3ad5384a9e4ae2d1a22a19169a6287a8')

package() {
  install -Dm755 "gamepad-osk-${pkgver}.bin" "$pkgdir/usr/bin/gamepad-osk"

  cd "gamepad-osk-${pkgver}"
  install -Dm644 config.example "$pkgdir/usr/share/gamepad-osk/config"
  install -Dm644 gamepad-osk.service "$pkgdir/usr/lib/systemd/user/gamepad-osk.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/gamepad-osk/README.md"
  install -Dm644 gamepad-osk.udev "$pkgdir/usr/lib/udev/rules.d/80-gamepad-osk.rules"
}
