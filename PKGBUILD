# Contributor: Manuel Serrano <Manuel.Serrano@inria.fr>
# Contributor: MCMic <come.bernigaud@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hop
pkgver=2.5.1
pkgrel=1
pkgdesc="Software Development Kit for the Web"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('bigloo-devel')
install=hop.install
url='http://hop.inria.fr'
source=(ftp://ftp-sop.inria.fr/indes/fp/Hop/$pkgname-$pkgver.tar.gz hop)
md5sums=('ab7abc46bb2bb5a4897ad074f1e40606'
         'c01ff06ad4faca90e6da4a2ee9b8e533')
options=('!makeflags')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr --etcdir=/etc/hop --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make DESTDIR=${pkgdir} install
  cd ${pkgdir}/usr/bin; rm hop; ln -s hop-$pkgver hop
  install -Dm755 $srcdir/hop ${pkgdir}/etc/rc.d/hop
  install -d ${pkgdir}/var/lib/hop
}
