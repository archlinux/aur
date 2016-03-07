# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=wxsvg
pkgver=1.5.5
pkgrel=2
pkgdesc="C++ library to create, manipulate and render SVG files"
arch=('i686' 'x86_64')
url="http://wxsvg.sourceforge.net/"
license=('custom:wxWindows')
depends=('wxgtk' 'ffmpeg' 'ffmpeg-compat' 'webkitgtk2')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/wxsvg/wxsvg/${pkgver}/wxsvg-${pkgver}.tar.bz2"
		"ffmpeg29.patch")
md5sums=('0aadf0a5ad80c19c003013ba63358d53'
         '7d22d946b9d8d56e8db67085a75b9cb0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../ffmpeg29.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/wxsvg/COPYING"
}
