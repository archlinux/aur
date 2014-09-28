# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Justin Kueser < [firstname] dot [lastname] at gmail dot com>

pkgname=ifhp
pkgver=3.5.22
pkgrel=1
pkgdesc="IFHP Filter"
arch=('i686' 'x86_64')
url="http://www.lprng.com"
license=('custom:Artistic')
depends=('lprng' 'file' 'perl-net-snmp')
optdepends=('ghostscript: postscript support' 'a2ps: ascii to ps support')
conflicts=()
backup=('etc/ifhp.conf')
source=(ftp://ftp.lprng.com/pub/LPRng/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('450b24f44dffbfda84a58ce5067ab1ad')


build() {
 
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -w -fpermissive" CFLAGS="${CFLAGS} -w -DHAVE_INET_NTOP" \
    ./configure --prefix=/usr --sysconfdir=/etc \
      --mandir=/usr/share/man --libexecdir=/usr/lib/ifhp

  make clean all

}

package() {
  
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
