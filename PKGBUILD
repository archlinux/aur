# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru' 'python2-pylru')
_name=pylru
pkgver=1.2.0
pkgrel=2
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL2')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://github.com/jlhutch/pylru/archive/v${pkgver}.tar.gz")
sha256sums=('c4dcf175f6317539199434db13ffea0f642a52fac1e547e2e5f0866686fc9292')

prepare() {
  cp -a ${_name}-${pkgver}{,-python2}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py build
}

package_python-pylru() {
  depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
}

package_python2-pylru() {
  depends=('python2')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
