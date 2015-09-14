pkgname=gss-ntlmssp
pkgver=0.6.0
pkgrel=1
pkgdesc="A GSSAPI Mechanism that implements NTLMSSP"
arch=(i686 x86_64)
url="https://fedorahosted.org/gss-ntlmssp/"
license=(custom)
depends=('autoconf' 'automake' 'docbook-xsl' 'doxygen' 'findutils' 'krb5' 'libtool' 'libxml2' 'libxslt' 'libunistring' 'm4' 'perl-extutils-pkgconfig' 'openssl')
source=("https://fedorahosted.org/released/gss-ntlmssp/gssntlmssp-0.6.0.tar.gz")
sha256sums=('2e259a92e0cf840f60bd1ec8501882efb374cfbfd7428c36b2e2db37ed545110ea7f366a71b57f82a5d22a6412408635b6ae633aa3ce0fd0641a9bb632547872')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd $pkgname
  autoreconf -f -ii
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
