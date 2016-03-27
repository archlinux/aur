# Maintainer: Ho Tuan Kiet <tuankiet65@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: kaptoxic <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Louis des Landes <aur@psykar.com>
# Contributor: dlech
# Contributor: Andreas Harter <aur@andreas-harter.de>
 
pkgname=keebuntu
pkgver=0.5.8
pkgrel=1
pkgdesc="App indicator icon for keepass (for unity, cinnamon & gnome)"
arch=('any')
url="https://github.com/dlech/Keebuntu"
license=('GPL2')
depends=('keepass' 'libappindicator-gtk2' 'libappindicator-sharp'
         'libindicator-gtk2' 'dbus-sharp-glib' 'gtk-sharp-2')
source=("https://github.com/dlech/Keebuntu/archive/v0.5.8.tar.gz")
install=$pkgname.install
sha256sums=('3f066b1e6a875a2b8a3f876d39ca72ef4bac2a906b85080405378dd8e9abbd49')
 
_keepassdir=usr/share/keepass/appindicator
_icondir=icons/hicolor/256x256/apps
 
build() {
  cd "${srcdir}/Keebuntu-${pkgver}"
  sed -i 's|/usr/lib/keepass2|/usr/share/keepass|' KeePassExe.proj
  sed -i 's|libMagickWand-6.Q16.so|libMagickWand-6.Q16HDRI.so|' ImageMagick/ImageMagick.dll.config
  xbuild /property:Configuration=Release ApplicationIndicator/AppIndicatorPlugin.csproj
}
 
package() {
  cd "${srcdir}/Keebuntu-${pkgver}"
  # Copy stuff across manually
  mkdir -p $pkgdir/$_keepassdir
  mkdir -p $pkgdir/usr/share/$_icondir
  cp ApplicationIndicator/bin/Release/* $pkgdir/$_keepassdir
  cp ApplicationIndicator/Resources/$_icondir/* $pkgdir/usr/share/$_icondir/
  rm $pkgdir/$_keepassdir/KeePass.*
}
 
# vim:set ts=2 sw=2 et:
