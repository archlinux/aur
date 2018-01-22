# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=multiqc
pkgbase='python-multiqc'
pkgname=('python-multiqc' 'python2-multiqc')
pkgver=1.4
pkgrel=2
pkgdesc="Create aggregate bioinformatics analysis reports across many samples and tools"
arch=('any')
url="https://pypi.python.org/pypi/multiqc"
license=('GPL3')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/af/a1/5c5702c4b0ce9ee6fb7d1c982cc6f20832a85bfce184dcb8178f0bdcb5df/multiqc-1.4.tar.gz)
sha256sums=('a83ea64c9a92137a63fc3c6ea37b13af241f9cd9b800eb17d9f03a5d7f261d46')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-multiqc() {
  depends=(
    'python2'
    'python2-click'
    'python2-future'
    'python2-jinja'
    'python2-lzstring'
    'python2-markdown'
    'python2-matplotlib'
    'python2-networkx'
    'python2-numpy'
    'python2-requests'
    'python2-simplejson'
    'python2-spectra'
    'python2-yaml')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  mv "${pkgdir}"/usr/bin/"${_name}" "${pkgdir}"/usr/bin/"${_name}"2
}

package_python-multiqc() {
  depends=(
    'python'
    'python-click'
    'python-future'
    'python-jinja'
    'python-lzstring'
    'python-markdown'
    'python-matplotlib'
    'python-networkx'
    'python-numpy'
    'python-requests'
    'python-simplejson'
    'python-spectra'
    'python-yaml')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
