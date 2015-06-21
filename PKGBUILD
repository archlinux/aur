# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: Essien Ita Essien <me@essienitaessien.com>
# Contributor: Tobias Sandmann <tSa *at* gmx *dot* eu>
# Contributor: pfm <nl081130@yahoo.de>
# Maintainer: Xyne <ca dot archlinux at xyne, backwards>

pkgname=omniorbpy-pyorbit-compat
pkgver=4.2.0
pkgrel=1
pkgdesc="omniORB is a CORBA object request broker for C++ and Python (this package is compatible with pyorbit)"
arch=(i686 x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb' 'pyorbit')
makedepends=('python2')
conflicts=('omniorbpy' 'omniorbpy-omg')
provides=('omniorbpy')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
sha512sums=('bb31ab18d6ab4ce32633b588c52ead09943fbe8e0475fd5240fcd97f9f59ccee166e7beb26f5afe619a028728aafc7881eeab27474bc422dcfb27d20deba951a')

build() {
  mkdir -p -- "$srcdir/omniORBpy-$pkgver/build"
  cd -- "$srcdir/omniORBpy-$pkgver/build"
  ../configure PYTHON=/usr/bin/python2 --prefix=/usr
  make
}

package() {
  cd -- "$srcdir/omniORBpy-$pkgver/build"
  make DESTDIR="$pkgdir" install

  # remove conflicting files
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__init__.py*
  rm "$pkgdir"/usr/lib/*/site-packages/CORBA.py*
  rm "$pkgdir"/usr/lib/*/site-packages/PortableServer.py*

  # adjust directory permissions
  find "$pkgdir" -type d -exec chmod 755 '{}' \;
  chmod 775 "$pkgdir"/{usr/include/omniORB4/,usr/lib/python2.7/site-packages/omniidl_be/}

}

# vim: set ts=2 sw=2 et:
