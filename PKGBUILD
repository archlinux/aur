# Maintainer: VCalV
_pkgname=qsf
pkgname="${_pkgname}-git"
pkgver=r16.6d4bd1f
pkgrel=1
pkgdesc="small and fast bayesian spam filter (git version)"
url="https://www.ivarch.com/programs/qsf/"
license=("Artistic-2.0")
depends=('gdbm')
makedepends=('git' 'autoconf' 'automake' 'gettext')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=('i686' 'x86_64')
source=("${_pkgname}::git+https://codeberg.org/ivarch/qsf.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -is
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr --without-mysql
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
