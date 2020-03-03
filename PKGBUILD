# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Former maintainer:
#   Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor:
#   parchd <parchd@archlinux.info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkg=opensmtpd-extras
pkgname=opensmtpd-table-passwd
pkgver=6.6.0
pkgrel=1
pkgdesc="table-passwd for using a passwd file with OpenSMTPd"
arch=('i686' 'x86_64')
url="https://opensmtpd.org"
license=('BSD')
depends=('opensmtpd')
conflicts=("${_pkg}")
makedepends=('openssl')
source=("https://www.opensmtpd.org/archives/${_pkg}-${pkgver}.tar.gz")
sha256sums=('126b023602e8bb222bf24543a056ee0a548343dc86d184669ff9d82dfca1fbdf')

build() {
  cd OpenSMTPD-extras-${pkgver}
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/smtpd \
    --libexecdir=/usr/lib/smtpd \
    --with-table-passwd
  make
}

check() {
  cd OpenSMTPD-extras-${pkgver}
  make -k check
}

package() {
  cd OpenSMTPD-extras-${pkgver}
  make DESTDIR="${pkgdir}" install
}
