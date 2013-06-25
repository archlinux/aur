# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: languiar <languitar at semipol dot de>

pkgname=ghmm
pkgver=0.9_rc1
_pkgver=${pkgver//_/-}
pkgrel=3
pkgdesc="General Hidden Markov Model library"
arch=('i686' 'x86_64')
url="http://ghmm.org"
license=('LGPL')
depends=('gsl' 'libxml2')
optdepends=('gsl' 'python2' 'python2-pygsl')
source=("http://sourceforge.net/projects/ghmm/files/ghmm/ghmm%200.9-rc1/$pkgname-$_pkgver.tar.gz")
md5sums=('34d09198401f3a3d6ea04dc8280cdb25')

build() {
  cd "$pkgname-$_pkgver"
  mv configure.in configure.ac
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make 
}

package() {
  cd "$pkgname-$_pkgver"
  make prefix="$pkgdir/usr" install
  mv "$pkgdir/usr/bin/cluster" "$pkgdir/usr/bin/ghmm-cluster"
}

