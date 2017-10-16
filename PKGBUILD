# Maintainer: Samuel Mesa <samuelmesa dot gmail.com>
# Initial Maintainer: strigyskow
# Contributor: snork

pkgname=spatialite-gui-devel
pkgver=2.0.0
pkgrel=2
pkgdesc="spatialite-gui is an open source Graphical User Interface (GUI) 
tool supporting SpatiaLite. Development version"
url="https://www.gaia-gis.it/fossil/spatialite_gui/index"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('libspatialite>=4.1.1-3' 'librasterlite2-devel' 'wxgtk')
conflicts=(spatialite-gui)
replaces=(spatialite-gui)
source=("http://www.gaia-gis.it/gaia-sins/spatialite-gui-sources/spatialite_gui-${pkgver}-devel.tar.gz"
		patch01_pointer.patch)
_pkgname=spatialite_gui

md5sums=('2ad2936e34923029b9b6cd94c428066c'
         'd3ae41d66f29d838089221dc793ee95e')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}-devel"
  patch -p0 < ../patch01_pointer.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-devel"

  ./configure --prefix="/usr" --disable-openjpeg
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-devel"
  make DESTDIR="${pkgdir}" install
  install -D -m644 gnome_resource/spatialite-gui.desktop "${pkgdir}"/usr/share/applications/spatialite-gui.desktop
  install -D -m644 gnome_resource/spatialite-gui.png "${pkgdir}"/usr/share/pixmaps/spatialite-gui.png
}
