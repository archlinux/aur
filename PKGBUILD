# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=distance
_title="${_name^}"
pkgbase='python-distance'
pkgname=('python-distance' 'python2-distance')
pkgver=0.1.3
pkgrel=1
pkgdesc="Many C implemented Levenshtein and Hamming distance computations in Python"
arch=('any')
url=https://github.com/doukremt/"${_name}"
license=('GPL2')
makedepends=(
  'cython'
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${_name}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_title:0:1}"/"${_title}"/"${_title}"-"${pkgver}".tar.gz)
sha256sums=('60807584f5b6003f5c521aa73f39f51f631de3be5cccc5a1d67166fcbf0d4551')

prepare() {
  cp -a "${_name}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-py2
  python2 setup.py build
}

package_python2-distance() {
  depends=('python2')

  cd "${_name}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-distance() {
  depends=('python')

  cd "${_name}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
