# Maintainer: thanx <thanxm at gmail dot com>
# Contributor: thanx <thanxm at gmail dot com>

pkgname=necpp-git
_pkgname="necpp"
pkgver=45.30ffb88
pkgrel=1
pkgdesc="Free NEC-2 compatable electromagnetic code. It can both read nec2 antenna description files and also be incorporated into other projects like GUI tools and automatic antenna optimization systems."
arch=('i686' 'x86_64')
url="https://github.com/tmolteno/necpp"
license=('GPL')
options=(!libtool)
provides=('necpp')
conflicts=('necpp' 'nec2pp' 'nec2++')
source=(git://github.com/tmolteno/necpp.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_pkgname}"
	
  make -f Makefile.git
  ./configure --prefix=/usr --without-lapack
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  
	make DESTDIR="${pkgdir}/" install
}
