# Maintainer: Samuel Mesa <samuelmesa dot gmail.com>
# Initial Maintainer: strigyskow
# Contributor: snork

pkgname=spatialite-gui-devel
pkgver=2.1.0
_pkgver=2.1.0-beta0
pkgrel=1
pkgdesc="spatialite-gui is an open source Graphical User Interface (GUI) 
tool supporting SpatiaLite. Development version"
url="https://www.gaia-gis.it/fossil/spatialite_gui/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite-devel' 'librasterlite2-devel' 'virtualpg2-devel' 'wxgtk' 'openjpeg2' 'libiconv')
conflicts=(spatialite-gui)
replaces=(spatialite-gui)
source=("http://www.gaia-gis.it/gaia-sins/spatialite-gui-sources/spatialite_gui-${_pkgver}.tar.gz")
_pkgname=spatialite_gui

md5sums=('f06289fa547e596d9c01c23c5e1722ec')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  ./configure --prefix="/usr" \
  CXXFLAGS="`wx-config --version=3.0 --cxxflags`" \
  LIBS="`wx-config --version=3.0 --libs`"

  make -j4
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 gnome_resource/spatialite-gui.desktop "${pkgdir}"/usr/share/applications/spatialite-gui.desktop
  install -D -m644 gnome_resource/spatialite-gui.png "${pkgdir}"/usr/share/pixmaps/spatialite-gui.png
}
