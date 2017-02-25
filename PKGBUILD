# $Id: PKGBUILD 255461 2015-12-10 04:57:04Z foutrelis $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=libgnomemm
pkgver=2.30.0
pkgrel=4
pkgdesc="C++ bindings for libgnome."
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libgnome>=2.28.0' 'gtkmm>=2.20.0')
makedepends=('pkgconfig')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('2a01f068ff73a1985d050e75f899fec34ac13622e2ead43523a4e2b0875042cf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
