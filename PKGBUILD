# $Id$
# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=kannel
PACKAGE=gateway
pkgver=1.4.4
pkgrel=1
pkgdesc="Kannel is a compact and very powerful open source WAP and SMS gateway"
arch=('any')
license=('custom')
url="https://www.kannel.org/"
depends=('bison2' 'libxml2')
conflicts=('bison')
groups=('base-devel')
source=(http://www.kannel.org/download/${pkgver}/${PACKAGE}-${pkgver}.tar.gz kannel.conf modems.conf default)
md5sums=('0048dab467931eb8472c31d5e1257401' '7090740f6f82d8973bf07ba538a3dd80' '24ae1183521fe871e39f499eed27b93a' '7575cd21bcd397bcc02a01b57fb4d429')

build() {
  cd ${srcdir}/${PACKAGE}-${pkgver}  
  ./configure --prefix=/usr/local --mandir=/usr/local/man --enable-start-stop-daemon
  make all
}

check() {
  cd ${srcdir}/${PACKAGE}-${pkgver}
  make check
}

package() {
  cd ${srcdir}
  install -Dm644 kannel.conf "$pkgdir/etc/kannel/kannel.conf"
  install -Dm644 modems.conf "$pkgdir/etc/kannel/modems.conf"
  install -Dm644 default "$pkgdir/etc/default/kannel"

  cd ${PACKAGE}-${pkgver}
  make DESTDIR=${pkgdir} install install-test install-checks install-contrib

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
