# Maintainer: Alad Wenter <alad@mailbox.org>
# Maintainer: jyantis <yantis@yantis.net>

# Based on the PKGBUILD for datamash from
# Timothy Rice <t.rice@ms.unimelb.edu.au>
pkgname=datamash-git
pkgver=1.2.r4.gfd49457
pkgrel=1
pkgdesc='A command-line program which performs numeric, textual and statistical operations on plain text data.'
arch=('x86_64' 'i686')
url='https://www.gnu.org/software/datamash/'
license=('GPL')
source=('git+https://git.savannah.gnu.org/git/datamash.git')
sha256sums=('SKIP')
depends=('glibc')
# XXX rsync/wget are only needed for .po files in bootstrap.
makedepends=('git' 'gperf' 'rsync' 'wget')
conflicts=('datamash')
provides=('datamash')

pkgver() {
  cd datamash
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd datamash
  ./bootstrap
  ./configure --prefix=/usr
  make
}

check() {
  cd datamash
  make check
}

package() {
  cd datamash
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
