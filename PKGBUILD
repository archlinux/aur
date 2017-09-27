pkgname=sendxmpp-git
pkgver=1.24.r15.g9186b8c
pkgrel=1
pkgdesc="A perl-script to send xmpp (jabber), similar to what mail(1) does for mail"
arch=('i686' 'x86_64')
url="https://sendxmpp.hostname.sk/"
license=('GPL')
depends=('perl' 'perl-net-xmpp' 'perl-io-socket-ssl')
conflicts=('sendxmpp')
provides=('sendxmpp')
options=('!emptydirs' 'docs')
source=("${pkgname}::git+https://github.com/lhost/sendxmpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgname"
  perl Makefile.PL PREFIX="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install
  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
