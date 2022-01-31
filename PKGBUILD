# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: yannsen <ynnsen@gmail.com>
# Contributor: vuillaume <vuillaume12@yahoo.com>
pkgname=tn5250
pkgver=0.17.4
pkgrel=7
pkgdesc='A 5250 terminal emulator for IBM iSeries and AS400'
arch=('i686' 'x86_64')
url="http://tn5250.sourceforge.net/"
license=('LGPL2.1')
depends=('openssl')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "patch-lib5250_sslstream_c.patch"::"http://cvsweb.openbsd.org/cgi-bin/cvsweb/~checkout~/ports/net/tn5250/patches/patch-lib5250_sslstream_c"
        "tn5250-0.17.4-format.patch")
sha256sums=('354237d400dc46af887cb3ffa4ed1f2c371f5b8bee8be046a683a4ac9db4f9c5'
            '87bdd8f6a53442d3c2c7a80385725b63106a96d622d52643cc3cdc2282e1e8f6'
            'aead8751833cc5bd8b7999b3e7ff6b907667bd26bf92acee4c5c674de6e2c6a3')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p0 -i "${srcdir}/patch-lib5250_sslstream_c.patch"
  patch -p0 -i "${srcdir}/tn5250-0.17.4-format.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --with-ssl=/usr/include/openssl
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
