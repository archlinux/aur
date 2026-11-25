# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=modrinth-app-bin
pkgver=0.23.5
pkgrel=1
pkgdesc="Minecraft mod manager and launcher from Modrinth (upstream binary)"
arch=('x86_64')
url="https://modrinth.com/app"
license=('GPL-3.0-only')
# what the binary links (readelf -d), plus what Minecraft loads, as in
# extra/modrinth-app
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libgcc' 'libsoup3' 'webkit2gtk-4.1'
         # loaded by Minecraft, not by the launcher
         'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm')
optdepends=('xorg-xrandr: for older Minecraft versions')
provides=('modrinth-app')
conflicts=('modrinth-app')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/modrinth/code/releases/download/v${pkgver}/Modrinth.App_${pkgver}_amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('f21ad1250a3e0a8639dceabbe74d4a6053ba586e3703d5179fc3de2459e90c07')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" usr
  ln -s ModrinthApp "$pkgdir/usr/bin/modrinth-app"
}
