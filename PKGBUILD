# $Id: PKGBUILD 227196 2014-11-29 19:32:57Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=freqtweak
pkgver=0.7.2
pkgrel=1
pkgdesc="Audio Effect Processor"
arch=('i686' 'x86_64')
depends=('wxgtk2.8' 'fftw' 'jack' 'libsigc++')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz" "FTutils.hpp.patch")
md5sums=('36a2ae6d0ed836c3e187fb922c1bc6c8' 'a7c8020cd232e4f09dee0075dd4084f2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch src/FTutils.hpp < ../FTutils.hpp.patch
  ./configure --prefix=/usr --with-wxconfig-path=/usr/bin/wx-config-2.8 CFLAGS="$CFLAGS -fpermissive"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  chmod 0755 "${pkgdir}/usr/bin/freqtweak"
}
