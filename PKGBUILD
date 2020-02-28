# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald <lantald at gmx.com>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.dot.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot <http://esclinux.tk>

_pkgname=qgis
pkgname="$_pkgname"-ltr
pkgver=3.10.3
pkgrel=1
pkgdesc='Geographic Information System (GIS); Long Term Release'
url='https://qgis.org/'
license=(GPL)
arch=(x86_64)
depends=(desktop-file-utils exiv2 gdal hicolor-icon-theme libzip python-qscintilla-qt5 qca qt5-3d
         qt5-serialport qt5-webkit qtkeychain qwtpolar spatialindex python-sip)
makedepends=(cmake fcgi gsl python-six qt5-tools txt2tags sip python-setuptools)
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin'
            'gsl: Georeferencer plugin'
            'python-gdal: DB Manager plugin; Processing plugin'
            'python-jinja: MetaSearch plugin'
            'python-owslib: MetaSearch plugin'
            'python-psycopg2: DB Manager plugin; Processing plugin'
            'python-pygments: MetaSearch plugin'
            'python-numpy: Processing plugin'
            'python-yaml: Processing plugin')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2")
# curl https://qgis.org/downloads/qgis-latest-ltr.tar.bz2.sha256
sha256sums=('0869704df9120dd642996ff1ed50213ac8247650aa0640b62f8c9c581c05d7a7')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../"$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_3D=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QWTPOLAR=TRUE \
    -DWITH_INTERNAL_QWTPOLAR=FALSE
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
