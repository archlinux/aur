# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Peter Crighton <petecrighton@googlemail.com>

_pkgname=liblscp
pkgname="${_pkgname}-svn"
pkgver=0.5.7.1.2923
pkgrel=1
pkgdesc="LinuxSampler Control Protocol (LSCP) wrapper library"
arch=('i686' 'x86_64')
url="http://www.linuxsampler.org/"
license=('LGPL')
depends=('glibc')
makedepends=('subversion' 'doxygen' 'libtool')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!libtool')
source=("${_pkgname}::svn+https://svn.linuxsampler.org/svn/${_pkgname}/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"

  echo $(sed -n 's/AM_INIT_AUTOMAKE.*, \(.*\))/\1/p' configure.ac).$(svnversion)
}

build() {
  cd "$srcdir/${_pkgname}"

  make -f Makefile.svn
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/${_pkgname}"

  make DESTDIR="$pkgdir/" install
}
