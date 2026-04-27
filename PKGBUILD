# Maintainer: 0x90shell
pkgname=gamepad-osk-bin
pkgver=2.1.0
pkgrel=2
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
sha256sums=('4a2b82d44159154dd1a7d027b2fe6d8e70f38aa4bb5d8f3cc9e6f455f02d1d40'
            'd772ddff4513126579f2e5adba2c5fd10757d09c38b10a6a29a2e6a9bc05fa62')

package() {
  install -Dm755 "gamepad-osk-${pkgver}.bin" "$pkgdir/usr/bin/gamepad-osk"

  cd "gamepad-osk-${pkgver}"
  install -Dm644 config.example "$pkgdir/usr/share/gamepad-osk/config"
  install -Dm644 gamepad-osk.service "$pkgdir/usr/lib/systemd/user/gamepad-osk.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/gamepad-osk/README.md"
  install -Dm644 gamepad-osk.udev "$pkgdir/usr/lib/udev/rules.d/80-gamepad-osk.rules"
}
