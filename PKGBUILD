# Maintainer: gameslayer
# Co-Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=recomplauncher-bin
pkgver=0.90.0.68
pkgrel=1
pkgdesc="Finds, installs, updates and starts recompiled and decompiled PC games (upstream binary)"
arch=('x86_64')
url="https://github.com/elripalda/RecompLauncher"
license=('GPL-3.0-or-later')
# What the binary links (readelf -d), plus what it loads at run time:
# the tray library and libudev for controllers.
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libayatana-appindicator' 'libgcc' 'libsoup3' 'libstdc++' 'systemd-libs'
         'webkit2gtk-4.1')
optdepends=('umu-launcher: run Windows games with Proton through umu-run'
            'xdg-utils: open links and folders'
            'zenity: the Winetricks window')
provides=('recomplauncher')
conflicts=('recomplauncher')
options=('!strip' '!debug')
# Upstream tags betas as v0.90.0-beta.42. pkgver keeps the form the AUR
# package already had (0.90.0.42); pkg.sh keeps _tag in sync.
_tag="v0.90.0-beta.68"
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${_tag}/RecompLauncher_${_tag#v}_amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('efd95589b4aad105e57b12900dad9f70a09ff09d9fc65c0d4f095ac2a614a9bc')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" ./usr

  # no icon theme reads 256x256@2, and the icon in it is 256px
  mv "$pkgdir/usr/share/icons/hicolor/256x256@2" "$pkgdir/usr/share/icons/hicolor/256x256"
}
