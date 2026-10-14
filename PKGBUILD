# Maintainer: TunarJamalov <jamalovtunar@gmail.com>
# Published as https://aur.archlinux.org/packages/pomofocus-bin
# On a new release: bump pkgver, reset pkgrel=1, run `updpkgsums` and
# `makepkg --printsrcinfo > .SRCINFO`, then push both files to the AUR repo.
pkgname=pomofocus-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Pomodoro focus timer that syncs your sessions to Pomo, the Discord study bot'
arch=('x86_64')
url='https://pomofocus.online/desktop'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon on desktops without native tray support')
provides=('pomofocus')
conflicts=('pomofocus')
options=('!strip' '!debug')
source=("pomo-focus-${pkgver}.deb::https://github.com/TunarJamalov/pomo/releases/download/desktop-v${pkgver}/pomo-focus_amd64.deb")
sha256sums=('2a13b514a84adc1e6b7a5792e7ecd23caec167c536620751d0ad0de09ee755c0')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"
  # The .deb installs to /opt/Pomo Focus; keep the pomofocus command earlier versions had
  install -d "$pkgdir/usr/bin"
  ln -s '/opt/Pomo Focus/pomo-focus' "$pkgdir/usr/bin/pomofocus"
}
