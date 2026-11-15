# Maintainer: he3als <he3als@users.noreply.github.com>
pkgname=discord-canary-prerelease-patched-electron-bin
pkgver=20261115.194528
pkgrel=1
pkgdesc='Discord Canary with patched Electron and Linux fixes (AVX2 required)'
arch=('x86_64')
url='https://github.com/discord-patched-electron/discord-patched-electron'
license=(MIT BSD-3-Clause AGPL-3.0-only GPL-2.0-or-later GPL-3.0-only LGPL-2.1-or-later)
depends=('glibc>=2.38' gcc-libs alsa-lib gtk3 libcups libxss libxtst libxcb nss libdrm libva libcap mesa libpulse 'python>=3.11' ca-certificates gnupg brotli bash coreutils pipewire pipewire-audio zenity)
optdepends=('xdg-desktop-portal: desktop screen selection' 'wireplumber: PipeWire session management' 'kdotool: KDE Plasma window labels' 'python-dbus: automatic PiP placement on KDE Wayland' 'python-gobject: automatic PiP placement on KDE Wayland' 'polkit: authorize DPE direct screen capture')
options=('!strip' '!debug')
provides=('discord-canary')
conflicts=(discord-canary discord-canary-electron-bin)
install=discord.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/discord-patched-electron/discord-patched-electron/releases/download/v20261115194528.0.0-canary.3c0a9f36b78c0494/discord-canary-prerelease-patched-electron-bin-linux-x86_64.tar.gz")
sha256sums=('52b5209f080f8fb42d5e88535c7edeac86150b14c5f12850ee1c89bb340581a4')

package() {
  install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -a "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/launch.sh" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$pkgname/launch.sh" "$pkgdir/usr/bin/discord-canary"
  install -Dm644 "$srcdir/$pkgname/discord-canary.desktop" \
    "$pkgdir/usr/share/applications/discord-canary.desktop"
  install -Dm644 "$srcdir/$pkgname/discord.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/discord-canary.png"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cp -a "$srcdir/$pkgname/licenses/." "$pkgdir/usr/share/licenses/$pkgname/"
}
