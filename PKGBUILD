# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: parchd <parchd@archlinux.info>

_pkg=opensmtpd-extras
pkgname=opensmtpd-table-passwd
pkgver=201703132115
pkgrel=1
pkgdesc="table-passwd for using a passwd file with OpenSMTPd"
arch=('i686' 'x86_64')
url="https://opensmtpd.org"
license=('BSD')
depends=('opensmtpd')
conflicts=("${_pkg}")
makedepends=('openssl')
source=("https://www.opensmtpd.org/archives/${_pkg}-${pkgver}.tar.gz")
sha256sums=('4672afdd756ef279c0adcfcbf8151d6d8a370d5a628a705967373a1c83ee0ef5')

build() {
  cd ${_pkg}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/smtpd \
    --libexecdir=/usr/lib/smtpd \
    --with-table-passwd
  make
}

check() {
  cd ${_pkg}-${pkgver}
  make -k check
}

package() {
  cd ${_pkg}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
