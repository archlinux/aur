# Maintainer: Guillerme Duvillié <guillerme at duvillie dot eu>

pkgname=pal-git
_repname=palcal
_pkgname=pal
pkgver=0.4.4
pkgrel=1
pkgdesc="A command-line calendar program."
arch=('i686' 'x86_64')
url="https://github.com/MFreeze/${_repname}"
license=('GPL3')
depends=('pkg-config' 'glib2' 'readline' 'gettext' 'gawk')
source=("git+${url}.git")
sha256sums=('SKIP')
provides=('pal')

prepare() {
  cd ${srcdir}/${_repname}/src
  sed -i "s:-O2 -Wall:${CFLAGS}:g" Makefile.defs
  sed -i "s: (Function\*)::" manage.c
}

build() {
  cd ${srcdir}/${_repname}/src
  make
}

package() {
  cd ${srcdir}/${_repname}/src
  make DESTDIR=${pkgdir} install-no-rm 
}
