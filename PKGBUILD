# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=modrinth-app-bin
pkgver=0.23.2
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
sha256sums=('4bcb152a7397e8ed4c1d2d243156119573392e3bbff20cdcc40377f8ab20538f')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" usr
  ln -s ModrinthApp "$pkgdir/usr/bin/modrinth-app"
}
