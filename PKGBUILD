# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=safekeep
pkgver=1.4.2
pkgrel=1
pkgdesc="A client/server backup system which enhances the power of rdiff-backup"
arch=('any')
url="http://safekeep.sourceforge.net"
license=('GPL')
depends=('python2' 'rdiff-backup' 'openssh')
makedepends=('asciidoc' 'docbook-xsl' 'xmlto')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('ab17c3b00248b99ba9015a75c0c816bf12f77108551f95da3de609112ab124dd')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  make docs
}

package () {
  cd ${srcdir}/$pkgname-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' $pkgname

  make DESTDIR=${pkgdir} install

#installing files
  install -D -m644 samples/sample.backup ${pkgdir}/etc/safekeep/backup.d/sample.backup
  install -D -m644 samples/client-script-sample.sh ${pkgdir}/etc/safekeep/backup.d/client-script-sample.sh
}
