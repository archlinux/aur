# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=sendxmpp
pkgver=1.23
pkgrel=1
pkgdesc="A perl-script to send xmpp (jabber), similar to what mail(1) does for mail"
arch=('i686' 'x86_64')
url="http://sendxmpp.platon.sk/"
license=('GPL')
depends=('perl' 'perl-net-xmpp' 'perl-io-socket-ssl')
options=('!emptydirs' 'docs')
source=(
  "http://ftp.debian.org/debian/pool/main/s/sendxmpp/sendxmpp_${pkgver}.orig.tar.gz"
)
sha256sums=(
  '8a8b408ebd1df0157418981035748d9eb2464d353c5ea8ac48b074b8a85b9616'
)
_dirname=lhost-${pkgname}-610082b

build() {
  cd "${srcdir}/${_dirname}"
  perl Makefile.PL PREFIX="${pkgdir}/usr"
  make
}

check() {
  cd "${srcdir}/${_dirname}"
  make test
}

package() {
  cd "${srcdir}/${_dirname}"
  make install
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
