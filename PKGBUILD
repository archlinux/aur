# Maintainer: sygnmdev <sygnmdev at sygnm dot org>
pkgname=sygnm
pkgver=1.0.0alpha1
pkgrel=1
pkgdesc="Computer algebra system (currently pre-alpha)"
arch=('i686' 'x86_64')
url="https://sygnm.org/"
license=('AGPL3')
depends=('flint' 'arb' 'boost-libs' 'icu' 'gmp' 'qt5-base' 'readline' 'python' 'sqlite')
makedepends=('boost' 'cmake' 'swig' 'python')
source=("local://$pkgname-$pkgver.tar.gz")
options=(debug !strip)
conflicts=('sygnm-git')

md5sums=('SKIP')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cmake . -DCMAKE_BUILD_TYPE=Debug -DSYGNM_BUILD_ALL=On -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
 cd "${srcdir}/$pkgname-$pkgver"
 make DESTDIR="$pkgdir/" install
 cd sygnm-jupyter
 python setup.py install --root="$pkgdir/" --optimize=1
 cd ../sygnm/python
 python setup.py install --root="$pkgdir/" --optimize=1
}
