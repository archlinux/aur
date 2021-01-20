#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# prev-Maintainer: Raimar Sandner <raimar.sandner@uibk.ac.at>

pkgname=cppqed-git
pkgver=2.100.3
pkgrel=1
pkgdesc="Highly flexible framework for simulating open quantum dynamics."
arch=('i686' 'x86_64')
url="http://cppqed.sourceforge.net"
license=(custom)
depends=('gcc-libs' 'boost' 'blitz-cppqed-hg' 'flens-git' 'python2' 'python2-numpy' 'python2-scipy' 'cmake' 'gsl')
makedepends=('git' 'gcc' 'cmake')
optdepends=()
provides=('cppqed')
conflicts=('cppqed')
source=("${pkgname}"::'git://git.code.sf.net/p/cppqed/cppqed#branch=Development')
md5sums=('SKIP')

pkgver() {
   cd "${pkgname}"
   echo "$(git describe --tags | sed 's|-|_|g')"
}

build() {
  cd "${pkgname}"
  mkdir $srcdir/$pkgname/build_release
  cd $srcdir/$pkgname/build_release
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=Release -DREGISTRY=Off ..
  make
}

package() {
  cd $srcdir/$pkgname/build_release
  make DESTDIR=$pkgdir install || return 1
  install -Dm644 "${srcdir}"/${pkgname}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}


