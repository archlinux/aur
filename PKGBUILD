# $Id: PKGBUILD 147492 2015-11-23 22:28:56Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>

pkgname=singular4
pkgver=4.0.3
_majver=4-0-3
pkgrel=1
pkgdesc="Computer Algebra System for polynomial computations, version 4"
arch=(i686 x86_64)
url="http://www.singular.uni-kl.de/"
license=(GPL)
depends=(flint cddlib) # polymake
makedepends=(doxygen)
source=("http://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/src/$_majver/${pkgname%4}-${pkgver//_/}.tar.gz") 
md5sums=('003ffe73776235313899f16c2258b510')

build() {
  cd ${pkgname%4}-${pkgver//_/}

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd ${pkgname%4}-${pkgver//_/}
  make DESTDIR="$pkgdir" install

# Install docs
  mkdir -p "$pkgdir"/usr/share/singular
  install -m644 doc/singular.idx "$pkgdir"/usr/share/singular/

# needed by Sage, not installed by default
  install -m644 Singular/links/sing_dbm.h "$pkgdir"/usr/include/singular/
}
