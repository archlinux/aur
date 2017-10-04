# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=gwenhywfar
pkgname=${_pkgname}-qt5
pkgver=4.18.0
pkgrel=1
pkgdesc="OS abstraction functions for various projects (with optional Qt5 GUI support)"
arch=(i686 x86_64)
url="http://www.aquamaniac.de"
license=("LGPL")
depends=('openssl' 'gnutls' 'libgcrypt' 'libice' 'libsm')
makedepends=('gtk2' 'qt4' 'qt5-base')
optdepends=('gtk2' 'qt4' 'qt5-base')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aqbanking/gwenhywfar/archive/${pkgver}.tar.gz")
sha256sums=('e98751badb1caa0dfd74f17678e11f0daf9505ff0df2542035a1071f8a9f04b8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  NOCONFIGURE=1 autoreconf -fi
  
  ./configure --prefix=/usr --sysconfdir=/etc --enable-ssl --with-guis='gtk2 qt4 qt5'
  sed -i 's|gnutls_transport_set_lowat||g' src/sio/syncio_tls.c
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
