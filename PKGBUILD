# Submitter: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
pkgname=fityk-git
pkgver=20140531
pkgrel=1
pkgdesc="A program for nonlinear fitting of analytical functions to data."
url="http://fityk.nieto.pl/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('lua' 'wxgtk' 'xylib' 'ruby' 'python')
makedepends=('boost' 'desktop-file-utils' 'git' 'python2-sphinx' 'swig')
optdepends=('gnuplot: can be used with the CLI')
provides=("fityk")
options=('!libtool')
install="fityk.install"
md5sums=()

_gitroot="http://github.com/wojdyr/fityk.git"

build() {
  [ -d ${srcdir}/${pkgname} ] || mkdir ${srcdir}/${pkgname}
  #thanks to masutu and in general the team from the fityk AUR package
  #This nowadays is almost identical to that one.
  cd ${srcdir}/${pkgname}
  git clone --depth 1 $_gitroot .

  #it doesn't build with sphinx for python3
  sed -i 's#sphinx-build#sphinx-build2#' doc/Makefile

  ./autogen.sh \
    --prefix=/usr \
    --with-wx-config=/usr/bin/wx-config
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
}
