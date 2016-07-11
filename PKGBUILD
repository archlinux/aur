# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=safekeep
pkgver=1.4.4
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
sha256sums=('928f75cf035d0eccc5a8c9c953411f6e65be2913ed9a59598729519404605627')

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
