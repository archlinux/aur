# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=fastcluster
pkgbase='python-fastcluster'
pkgname=('python-fastcluster' 'python2-fastcluster')
pkgver=1.1.24
pkgrel=2
pkgdesc="Fast hierarchical clustering routines for R and Python"
arch=('any')
url="https://pypi.python.org/pypi/fastcluster"
license=('BSD')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/1e/00/9910dd324f32582051d0ee6922c3cd4727234aae96366f3867c46a70cd78/fastcluster-1.1.24.tar.gz)
sha256sums=('a5d1922b1db6f4c3012416e7dc14de2984b9335a48c895e1698afd5c718312b0')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-fastcluster() {
  depends=('python2' 'python2-numpy')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}

package_python-fastcluster() {
  depends=('python' 'python-numpy')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
