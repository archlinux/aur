# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=safekeep
pkgver=1.4.5
pkgrel=1
pkgdesc="A client/server backup system which enhances the power of rdiff-backup"
arch=('any')
url="http://safekeep.sourceforge.net"
license=('GPL')
depends=('python2' 'rdiff-backup' 'openssh')
makedepends=('asciidoc' 'docbook-xsl' 'xmlto')
install=$pkgname.install
backup=('etc/safekeep/safekeep.conf'
        'etc/cron.daily/safekeep')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('89f3bd3cddc5aebf9af4380956735ebc09fd1ee5c55395f6886f205658847372')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make docs
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' $pkgname

  make DESTDIR="${pkgdir}" install

#installing files
  install -Dm644 samples/sample.backup "${pkgdir}"/etc/safekeep/backup.d/sample.backup
  install -Dm644 samples/client-script-sample.sh "${pkgdir}"/etc/safekeep/backup.d/client-script-sample.sh
}
