# Maintainer: Stanislaw Datskevich <me a nek0 net>
# Contributor: Gregor Robinson <gregor@fiatflux.co.uk>
# Contributor: Martin Perner <martin dot perner at gmail dot com>

pkgname=pkcs11-helper
pkgver=1.11
pkgrel=1
pkgdesc="A library that simplifies the interaction with PKCS11 providers for end-user applications using a simple API and optional OpenSSL engine."
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/opensc/wiki/pkcs11-helper"
license=('GPL' 'BSD')
depends=('gnutls' 'nss' 'openssl')
options=('!libtool')
provides=('pkcs11-helper')
conflicts=('pkcs11-helper')
source=(https://github.com/OpenSC/pkcs11-helper/archive/pkcs11-helper-$pkgver.tar.gz)
sha512sums=('098bbd8fdfe1df065f3acc402faa95bbba9a440ed4327f0d976d0e8fe0a2cac8546d33481b2fa85493f600ec56f248db01835edf10b3ed608fea67f27c3c54c2')

build() {
  cd ${srcdir}/pkcs11-helper-pkcs11-helper-1.11
  libtoolize
  aclocal
  autoheader
  automake --add-missing
  autoreconf -v
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/pkcs11-helper-pkcs11-helper-1.11
  make DESTDIR="${pkgdir}" install
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm644 COPYING* "${pkgdir}/usr/share/licenses/${pkgname}/"
}

