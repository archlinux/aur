# $Id: PKGBUILD 147492 2015-11-23 22:28:56Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>

pkgname=singular4
pkgver=4.0.2_p2
_majver=4-0-2
pkgrel=1
pkgdesc="Computer Algebra System for polynomial computations, version 4"
arch=(i686 x86_64)
url="http://www.singular.uni-kl.de/"
license=(GPL)
depends=(flint cddlib) # polymake
makedepends=(doxygen)
source=("http://www.mathematik.uni-kl.de/ftp/pub/Math/Singular/src/$_majver/$pkgname-${pkgver//_/}.tar.gz") 
md5sums=('ed2842f1ca8e907cd9ca14bda40460bb'
         'e69ad9daf0070715daf1defb03dcaed6')

build() {
  cd $pkgname-${pkgver//_/}

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd $pkgname-${pkgver//_/}
  make DESTDIR="$pkgdir" install

# Install docs
  mkdir -p "$pkgdir"/usr/share/singular
  install -m644 doc/singular.hlp "$pkgdir"/usr/share/singular/
  install -m644 doc/singular.idx "$pkgdir"/usr/share/singular/

# needed by Sage, not installed by default
  install -m644 Singular/links/sing_dbm.h "$pkgdir"/usr/include/singular/
}
