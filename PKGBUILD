# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Hanspeter Portner <ventosus at airpost dot net>

pkgname=linuxptp-git
pkgver=1.5.r13.g572438b
pkgrel=2
pkgdesc='An implementation of the Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux.'
arch=('i686' 'x86_64')
url='http://linuxptp.sourceforge.net/'
license=('GPL')
depends=('glibc')
makedepends=()
provides=('linuxptp')
conflicts=('linuxptp')
source=("$pkgname::git+http://git.code.sf.net/p/linuxptp/code")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,^[^0-9]*,,;s,-([0-9][0-9]*),.r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  cd $pkgname
  make prefix="${pkgdir}/usr" sbindir='$(prefix)/bin' mandir='$(prefix)/share/man' man8dir='$(mandir)/man8' install
}
