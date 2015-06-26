# Maintainer: Henrik Hallberg <halhen at k2h dot se>

pkgname=icsiboost
pkgver=160
pkgrel=1
pkgdesc="Open-source implementation of Boostexter (Adaboost based classifier)"
arch=(i686 x86_64)
url="http://code.google.com/p/icsiboost/"
license=('LGPL')
depends=()
optdepends=()
makedepends=('subversion')
provides=('icsiboost')
conflicts=()
source=()
md5sums=()

_svntrunk="http://icsiboost.googlecode.com/svn/trunk/"
_svnmod="icsiboost"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} -r ${pkgver} ${_svnmod}
  fi

  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${srcdir}/${_svnmod}/icsiboost ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build

  ./configure --prefix=/usr || return 1
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  install -m644 -D COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

}
