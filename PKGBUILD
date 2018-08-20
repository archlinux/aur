# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru' 'python2-pylru')
_name=pylru
pkgver=1.1.0
pkgrel=1
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL2')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e03a3d354eb8fdfa11638698e8a1f06cd3b3a214ebc0a120c603a79290d9ebec')

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
  makedepends=('python-setuptools')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
}

package_python2-pylru() {
  depends=('python2')
  makedepends=('python2-setuptools')

  cd "${srcdir}/${_name}-${pkgver}-python2"
  python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
