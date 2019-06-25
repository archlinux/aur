# Maintainer : Leonidas Spyropoulos <artafinde at gmail com>
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=wxsvg
pkgver=1.5.19
pkgrel=1
pkgdesc="C++ library to create, manipulate and render SVG files"
arch=('i686' 'x86_64')
url="http://wxsvg.sourceforge.net/"
license=('custom:wxWindows')
depends=('wxgtk' 'ffmpeg' 'libexif')
options=('!libtool')
source=("https://downloads.sourceforge.net/project/wxsvg/wxsvg/${pkgver}/wxsvg-${pkgver}.tar.bz2")
sha256sums=('3f78783fb1ea8242cc3f5f4d9b5ca8c79ea90f0837849f5a908478e13a560f9e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/wxsvg/COPYING"
}
