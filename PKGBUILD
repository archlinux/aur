# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=nitrogen
pkgver=1.6.0
pkgrel=1
pkgdesc="Background browser and setter for X windows"
arch=('i686' 'x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg')
source=(http://projects.l3ib.org/nitrogen/files/${pkgname}-${pkgver}.tar.gz
	nitrogen.appdata.xml)
sha256sums=('c41b6c2139cbed629cb9d0c72e52e4575768d31c208fcdc5c48edd83e6a51590'
            'bc1d4922f8c28fce19141dc411e9ebe65a55514bf5e2cf658227445a091aaf73')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install ${srcdir}/nitrogen.appdata.xml data/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

