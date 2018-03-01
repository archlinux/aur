# $Id$
# Maintainer  : Timo Sarawinski <t.sarawinski@gmail.com>
# This package provides proper systemd service files that will not conflict with openvas-systemd package
pkgname=openvas-scanner-systemd
_pkgname=openvas-scanner
pkgver=5.1.1
pkgrel=1
pkgdesc='The OpenVAS scanning Daemon with proper systemd service files'
arch=('x86_64')
url='http://www.openvas.org/'
license=('GPL')
depends=( 'openvas-libraries' 'redis' 'openvas-systemd' )
makedepends=('cmake' 'xmltoman' 'doxygen')
provides=('openvas-scanner')
groups=(openvas)
# These URLs need to be manually updated on every pkgver upgrade.
# http://wald.intevation.org/frs/?group_id=29
source=("http://wald.intevation.org/frs/download.php/2423/openvas-scanner-5.1.1.tar.gz"
        "http://wald.intevation.org/frs/download.php/2424/openvas-scanner-5.1.1.tar.gz.sig")
sha512sums=('8ca23fe9581c98381c030ee8e30a09876d538133980a589eff357321d2ceea0b24dbf8965ef7417e12abb9af240c6a26413b3041b219d28017c7f9ea04779fe1'
            'SKIP')
validpgpkeys=(
              'C3B468D2288C68B9D526452248479FF648DB4530' # OpenVAS Transfer Integrity
)

build() {
  cd "${_pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var .
  make
  make doc
  make doc-full
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
