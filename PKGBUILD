# Maintainer: riccardomarotti
# This package installs an independently built binary of unmodified upstream
# Karere. Build recipe: https://github.com/riccardomarotti/karere/tree/main/packaging/karere-bin

pkgname=karere-bin
pkgver=4.4.1
pkgrel=1
pkgdesc='Native GTK4/libadwaita WhatsApp client (prebuilt from upstream releases)'
arch=('x86_64')
url='https://github.com/tobagin/karere'
license=('GPL-3.0-or-later')
options=('!strip' '!debug')
provides=("karere=$pkgver")
conflicts=('karere' 'karere-git' 'karere-custom-css')

depends=(
  'gtk4' 'libadwaita' 'glib2' 'gdk-pixbuf2' 'libepoxy'
  'hicolor-icon-theme' 'alsa-lib' 'at-spi2-core' 'cairo'
  'dbus' 'dconf' 'expat' 'fontconfig' 'graphene' 'harfbuzz'
  'lcms2' 'libcups' 'libdrm' 'libjpeg-turbo' 'libx11'
  'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'openjpeg2'
  'pango' 'systemd-libs' 'wayland'
)
optdepends=(
  'hunspell: spell checking support'
  'libappindicator-gtk3: system tray integration'
)

_archive="karere-$pkgver-$pkgrel-linux-x86_64.tar.zst"
source=("$_archive::https://github.com/riccardomarotti/karere/releases/download/karere-bin-v$pkgver-$pkgrel/$_archive")

# Deliberate placeholder: the release workflow MUST replace this with the
# SHA256 of the published binary, and verify it, before pushing to AUR.
sha256sums=('e929538c0a9102f1e80c17b3c159ac55b65e48ae7e31d904df0b5698218fb334')

package() {
  install -d "$pkgdir"
  cp -a "$srcdir/usr" "$pkgdir/"
  test -x "$pkgdir/usr/bin/karere"
  test -f "$pkgdir/usr/lib/karere/cef/libcef.so"
  test -f "$pkgdir/usr/share/licenses/karere-bin/LICENSE"
}
