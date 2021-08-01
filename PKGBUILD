# Maintainer: Samuel Mesa <samuelmesa dot mail.com>
# Initial Maintainer: strigyskow
# Contributor: snork

pkgname=spatialite-gui
pkgver=2.1.0
_pkgver=2.1.0-beta1
pkgrel=2
pkgdesc="spatialite-gui is an open source Graphical User Interface (GUI) tool supporting SpatiaLite."
url="https://www.gaia-gis.it/fossil/spatialite_gui/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite' 'librasterlite2' 'wxgtk3')
conflicts=(spatialite_gui)
replaces=(spatialite_gui)
source=("http://www.gaia-gis.it/gaia-sins/spatialite-gui-sources/spatialite_gui-${_pkgver}.tar.gz")
_pkgname=spatialite_gui
md5sums=('9e8157f68c1f9ef77c31b229936b147f')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  sed -ie 's/(wx-config --libs)/(wx-config --libs all)/g' ./configure.ac
  sed -ie 's/-lgeos_c/-lgeos_c -lsqlite3/' configure.ac

  autoconf
  ./configure --prefix="/usr"
  make
  make check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 gnome_resource/spatialite-gui.desktop "${pkgdir}"/usr/share/applications/spatialite-gui.desktop
  install -D -m644 gnome_resource/spatialite-gui.png "${pkgdir}"/usr/share/pixmaps/spatialite-gui.png
}

# vim:set ts=2 sw=2 et:
