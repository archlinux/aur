# Maintainer: mickele
# Contributor: Brice Méalier <mealier_brice *at* yahoo *dot* fr>
# Contributor: Essien Ita Essien <me *at* essienitaessien *dot* com>
# Contributor: Tobias Sandmann <tSa *at* gmx *dot* eu>
# Contributor: pfm <nl081130 *at* yahoo *dot* de>
# Contributor: mortbauer <mortbauer *at* gmail *dot* com>
 
pkgname=omniorbpy36
pkgver=3.6
pkgrel=1
pkgdesc="omniORB is a CORBA object request broker for C++ and Python. Legacy version."
arch=(i686 x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb416' 'python2')
conflicts=('omniorbpy-omg' 'pyorbit' 'omniorbpy')
provides=('pyorbit' 'omniorbpy=3.6')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
 
build() {
  mkdir -p -- "$srcdir/omniORBpy-$pkgver/build"
  cd -- "$srcdir/omniORBpy-$pkgver/build"
  ../configure PYTHON=/usr/bin/python2 --prefix=/usr
  make
}
 
package() {
  cd -- "$srcdir/omniORBpy-$pkgver/build"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/lib/python2.7/site-packages/omniidl_be/__init__.py*
 
  # adjust directory permissions
  find "$pkgdir" -type d -exec chmod 755 '{}' \;
  chmod 775 "$pkgdir"/{usr/include/omniORB4/,usr/lib/python2.7/site-packages/omniidl_be/}
 
}
md5sums=('a7ab4789b913313f18a1171ff7a140b7')
