# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=ordered-set
pkgbase='python-ordered-set'
pkgname=('python-ordered-set' 'python2-ordered-set')
pkgver=2.0.2
pkgrel=2
pkgdesc="Python MutableSet that remembers its order, so that every entry has an index"
arch=('any')
url="https://pypi.python.org/pypi/ordered-set"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/c3/1c/4ddba479a75369b31655e295463bc37e5f84acb4fa7f34548946ff0160e3/ordered-set-2.0.2.tar.gz)
sha256sums=('942cad5d7d5b0760d5cbe93dfb385ac2ed402ca1d48c9f4e102d7d5cce3a90eb')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-ordered-set() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 MIT-LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-ordered-set() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 MIT-LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
