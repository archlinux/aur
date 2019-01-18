# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: mickele
# Contributor: Brice Méalier <mealier_brice *at* yahoo *dot* fr>
# Contributor: Essien Ita Essien <me *at* essienitaessien *dot* com>
# Contributor: Tobias Sandmann <tSa *at* gmx *dot* eu>
# Contributor: pfm <nl081130 *at* yahoo *dot* de>
# Contributor: mortbauer <mortbauer *at* gmail *dot* com>
 
pkgname=omniorbpy
pkgver=4.2.3
pkgrel=1
pkgdesc="omniORB is a CORBA object request broker for C++ and Python."
arch=(i686 x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb' 'python2')
conflicts=('omniorbpy-omg' 'pyorbit')
provides=('pyorbit')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
sha256sums=('5c601888e57c7664324357a1be50f2739c468057b46fba29821a25069fc0aee5')
 
build() {
  cd "$srcdir/omniORBpy-$pkgver"
  ./configure PYTHON=/usr/bin/python2 --prefix=/usr
  make
}
 
package() {
  cd "$srcdir/omniORBpy-$pkgver"
  make DESTDIR="$pkgdir" install
 
  # remove conflicting files
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__init__.py*
 
  # adjust directory permissions
  find "$pkgdir" -type d -exec chmod 755 '{}' +
}
