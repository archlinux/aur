# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Hanspeter Portner <ventosus at airpost dot net>

_pkgname=linuxptp
pkgname=${_pkgname}-git
pkgver=3.1.r116.g24220e8
pkgrel=1
pkgdesc='An implementation of the Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux.'
arch=('i686' 'x86_64')
url='http://linuxptp.sourceforge.net/'
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
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
