# Maintainer: strigyskow
pkgname=spatialite-gui
pkgver=1.7.1
pkgrel=1
pkgdesc="spatialite-gui is an open source Graphical User Interface (GUI) tool supporting SpatiaLite."
url="https://www.gaia-gis.it/fossil/spatialite_gui/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite>=4.1.1-3' libgaiagraphics wxgtk)
conflicts=(spatialite_gui)
replaces=(spatialite_gui)
source=("http://www.gaia-gis.it/gaia-sins/spatialite_gui-${pkgver}.tar.gz")
_pkgname=spatialite_gui

md5sums=('c917f40810607784528b4db58cd36efb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -ie 's/(wx-config --libs)/(wx-config --libs all)/g' ./configure.ac
  autoconf
  ./configure --prefix="/usr"
  make
  make check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 gnome_resource/spatialite-gui.desktop "${pkgdir}"/usr/share/applications/spatialite-gui.desktop
  install -D -m644 gnome_resource/spatialite-gui.png "${pkgdir}"/usr/share/pixmaps/spatialite-gui.png
}

# vim:set ts=2 sw=2 et:
