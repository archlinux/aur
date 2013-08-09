# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Based on PKGBUILD firefox-extension-video-downloadhelper

_plugin_name=nagioschecker
_plugin_version=0.16
pkgdesc="Plugin for firefox, statusbar indicator of the events from the network monitoring system Nagios."
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=14
arch=('any')
url="https://code.google.com/p/nagioschecker/"
depends=("firefox>=3.0")
source=("https://addons.mozilla.org/firefox/downloads/latest/3607/addon-3607-latest.xpi")
md5sums=('6ad71fd4d6fed74a272072f804abb80e')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir

  cp -dpr --no-preserve=ownership * $dstdir

  # Increase max version (reported on https://addons.mozilla.org/en-US/firefox/addon/nagios-checker/)
  sed -i 's/<em:maxVersion>\(.*\)<\/em:maxVersion>/<em:maxVersion>99\.*\.\*<\/em:maxVersion>/' $dstdir/install.rdf

  rm $dstdir/addon-3607-latest.xpi
  chmod -R 755 $dstdir
}
