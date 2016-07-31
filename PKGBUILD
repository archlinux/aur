pkgname=gss-ntlmssp
pkgver=0.7.0
pkgrel=1
pkgdesc="A GSSAPI Mechanism that implements NTLMSSP"
arch=(i686 x86_64)
url="https://fedorahosted.org/gss-ntlmssp/"
license=(custom)
depends=('autoconf' 'automake' 'docbook-xsl' 'doxygen' 'findutils' 'krb5' 'libtool' 'libxml2' 'libxslt' 'libunistring' 'm4' 'perl-extutils-pkgconfig' 'openssl')
source=("https://fedorahosted.org/released/gss-ntlmssp/gssntlmssp-${pkgver}.tar.gz")
sha512sums=('43fc9e57c00e74be3c6954b3f43677e176f6284a543917533d7e427dff98810f1547336cdc240e5f9161f62975803f4b39c925a429c6c669202267da99e3d841')

prepare() {
  cd "${srcdir}/gssntlmssp-${pkgver}"
  autoreconf -f -i
}

build() {
  cd "${srcdir}/gssntlmssp-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/gssntlmssp-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
