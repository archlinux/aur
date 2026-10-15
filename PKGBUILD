# Maintainer: TunarJamalov <jamalovtunar@gmail.com>
# Published as https://aur.archlinux.org/packages/pomofocus-bin
# On a new release: bump pkgver, reset pkgrel=1, run `updpkgsums` and
# `makepkg --printsrcinfo > .SRCINFO`, then push both files to the AUR repo.
# Since 2.0.0 the app is the Rust build from pomo-desktop-rs (no Electron).
pkgname=pomofocus-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Pomodoro focus timer that syncs your sessions to Pomo, the Discord study bot'
arch=('x86_64')
url='https://pomofocus.online/desktop'
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'xdg-utils')
optdepends=('libx11: running in an X11 session'
            'libxcursor: cursor themes on X11'
            'libxkbcommon-x11: keyboard layouts on X11')
provides=('pomofocus')
conflicts=('pomofocus')
options=('!debug')
source=("pomo-focus-${pkgver}.deb::https://github.com/TunarJamalov/pomo/releases/download/desktop-v${pkgver}/pomo-focus_amd64.deb")
sha256sums=('67ac1c7542e63fefee94f16f51fe239d73cb4f1c76468d60658b1a66d4554df9')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"
  # Keep the pomofocus command earlier versions had
  install -d "$pkgdir/usr/bin"
  ln -s pomo-focus "$pkgdir/usr/bin/pomofocus"
}
