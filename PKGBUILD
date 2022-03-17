# Maintainer: Matyas Mehn <matyas.mehn at tum dot de>

_pkgname=hyp2mat
pkgname=hyp2mat-git
pkgver=20200722
pkgrel=1
pkgdesc="Utility to convert HyperLynx pcb files to matlab for electromagnetic simulation"
arch=("x86_64")
url="https://github.com/koendv/$_pkgname"
license=("LGPL3")
depends=("zlib")
makedepends=("help2man" "groff" "gengetopt")
source=("git+https://github.com/koendv/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  ./bootstrap.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=${pkgdir}/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
}
