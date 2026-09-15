# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=modrinth-enhanced-bin
pkgver=0.21.2
pkgrel=1
pkgdesc="Modrinth App without ads or telemetry, with offline and Ely.by accounts and Linux fixes (upstream binary)"
arch=('x86_64')
url="https://github.com/Felitendo/Modrinth-Enhanced"
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libgcc' 'libsoup3' 'webkit2gtk-4.1'
         # loaded by Minecraft, not by the launcher
         'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm')
optdepends=('xorg-xrandr: for older Minecraft versions')
provides=('modrinth-enhanced')
conflicts=('modrinth-enhanced')
options=('!strip' '!debug')
# A new revision of the patches on the same Modrinth App release is tagged
# v0.21.2-2, which pkgver spells 0.21.2.r2; see pkg.sh.
_tag="v0.21.2"
_asset="Modrinth.Enhanced_0.21.2_amd64.deb"
source=("${pkgname}-${pkgver}.deb::https://github.com/Felitendo/Modrinth-Enhanced/releases/download/${_tag}/${_asset}")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('32ed32575050b4ac1a990b54a894e82c17860a48d5a228ce0d1ce7fc2c9d5d6f')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" usr
  ln -s ModrinthEnhanced "$pkgdir/usr/bin/modrinth-enhanced"
}
