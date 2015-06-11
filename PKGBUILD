# Maintainer:  jyantis <yantis@yantis.net>

# Based on the PKGBUILD for datamash from
# Timothy Rice <t.rice@ms.unimelb.edu.au>

pkgname=datamash-git
pkgver=v1.0.6.r54.gf8ae71f
pkgrel=2
pkgdesc='A command-line program which performs numeric, textual and statistical operations on plain text data.'
arch=('any')
url='https://www.gnu.org/software/datamash/'
license=('GPL')
source=('git://git.sv.gnu.org/datamash.git')
sha256sums=('SKIP')
depends=('glibc')
makedepends=('git')
conflicts=('datamash')
provides=('datamash')
install=datamash.install
pkgver() {
  cd datamash
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
