# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=safekeep
pkgver=1.5.0
pkgrel=1
pkgdesc="A client/server backup system which enhances the power of rdiff-backup"
arch=('any')
url="http://safekeep.sourceforge.net"
license=('GPL')
depends=('python' 'rdiff-backup' 'openssh')
makedepends=('asciidoc' 'docbook-xsl' 'xmlto' 'git')
install=$pkgname.install
backup=('etc/safekeep/safekeep.conf'
        'etc/cron.daily/safekeep')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('128e15f0e76355d7aa6056d044dc248f86317dee474c549bc73cede28947d0a0')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make docs
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

#Python fix
  sed -i 's_!/usr/bin/python3_!/usr/bin/python_' $pkgname

  make DESTDIR="${pkgdir}" install

#installing files
  install -Dm644 samples/sample.backup "${pkgdir}"/etc/safekeep/backup.d/sample.backup
  install -Dm644 samples/client-script-sample.sh "${pkgdir}"/etc/safekeep/backup.d/client-script-sample.sh
}
