# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Peter Crighton <petecrighton@googlemail.com>

_pkgname=liblscp
pkgname="${_pkgname}-svn"
pkgver=0.9.0.r3843
pkgrel=1
pkgdesc="LinuxSampler Control Protocol (LSCP) wrapper library"
arch=('i686' 'x86_64')
url="http://www.linuxsampler.org/"
license=('LGPL2.1')
depends=('glibc')
makedepends=('subversion' 'doxygen' 'libtool')
conflicts=("${_pkgname}")
provides=("${_pkgname}" "${_pkgname}=${pkgver/\.r*/}" 'liblscp.so')
source=("${_pkgname}::svn+https://svn.linuxsampler.org/svn/${_pkgname}/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"

  echo $(grep '^AC_INIT' configure.ac | cut -d , -f 2).r$(svnversion)
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/${_pkgname}"

  make DESTDIR="$pkgdir/" install
}
