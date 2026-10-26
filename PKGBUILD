# Maintainer: he3als <he3als@users.noreply.github.com>
pkgname=discord-canary-prerelease-patched-electron-bin
pkgver=20261026.115349
pkgrel=1
pkgdesc='Discord Canary with patched Electron and Linux fixes (AVX2 required)'
arch=('x86_64')
url='https://github.com/discord-patched-electron/discord-patched-electron'
license=(MIT BSD-3-Clause AGPL-3.0-only)
depends=('glibc>=2.38' gcc-libs alsa-lib gtk3 libcups libxss libxtst nss libdrm mesa libpulse 'python>=3.11' ca-certificates gnupg brotli bash coreutils pipewire pipewire-audio zenity)
optdepends=('xdg-desktop-portal: desktop screen selection' 'wireplumber: PipeWire session management' 'kdotool: KDE Plasma window labels')
options=('!strip' '!debug')
provides=('discord-canary')
conflicts=(discord-canary discord-canary-electron-bin)
install=discord.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/discord-patched-electron/discord-patched-electron/releases/download/v20261026115349.0.0-canary.e04338a32f2d1601/discord-canary-prerelease-patched-electron-bin-linux-x86_64.tar.gz")
sha256sums=('1f4ac4c079934bfeb67fa912ed5622c5d5c492595f0fbad07f0049beb4aa75b3')

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
