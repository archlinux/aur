# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=gsasl-ntlm
_pkgname=gsasl
pkgver=1.8.0
pkgrel=1
pkgdesc="Simple Authentication and Security Layer framework and a few common SASL mechanisms - NTLM support"
arch=('i686' 'x86_64')
url="http://josefsson.org/gsasl/"
license=('GPL')
depends=('gnutls' 'libidn' 'krb5' 'libgcrypt' 'libntlm')
provides=('gsasl')
conflicts=('gsasl')
install=gsasl.install
source=(ftp://ftp.gnu.org/gnu/gsasl/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('343fd97ae924dc406986c02fb9b889f4114239ae')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's|error too old libgcrypt|/*error too old libgcrypt*/|' lib/configure
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gssapi-impl=mit --enable-ntlm
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
