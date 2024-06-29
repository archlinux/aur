# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pycachesim
pkgname=python-$_name
pkgrel=2
pkgver=0.3.1
pkgdesc="Python Cache Hierarchy Simulator"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/$_name"
license=('GPLv3')
# iaca does currently not build from AUR. You might want to install it by hand and uncomment it here
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('1d84977a2b8873e537b9e589f484faec42a9323bb6526ce279d0798a54f35c5a')

build() {
  cd ${srcdir}/$_name-$pkgver
  CFLAGS+=" -Wno-error=incompatible-pointer-types"
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-$pkgver
  # install package
  python setup.py install --root="$pkgdir" --optimize=1

  # license
  install -Dm644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
