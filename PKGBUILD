# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=PyEntrezId
pkgbase='python-pyentrezid'
pkgname=('python-pyentrezid' 'python2-pyentrezid')
pkgver=1.5.8.2
pkgrel=1
pkgdesc="Converts Ensembl, Uniprot, and HGNC IDs to Entrez Gene Id"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  https://raw.githubusercontent.com/lwgray/pyEntrezId/28286cf21b876dd4894bf21a222dfd1022441b75/LICENSE
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/3f/23/14d4062c213506b25e453d2a858a3ce7564e821b1ae0d3f9b1619d739594/PyEntrezId-1.5.8.2.tar.gz
)
sha256sums=(
  '21366ef752c0c7fbf91c46ff163212d3991c6f31cf5edd216467966c50783e7e'
  'eb413e67109c1609464fda325fd1b6703bdfacff93e83cfd02e9ba2b937c230f'
)

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-pyentrezid() {
  depends=(
    'python2'
    'python2-colorama'
    'python2-nose'
    'python2-pygments'
    'python2-rednose'
    'python2-termstyle'
    'python2-requests'
    'python2-xmltodict')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-pyentrezid() {
  depends=(
    'python'
    'python-colorama'
    'python-nose'
    'python-pygments'
    'python-rednose'
    'python-termstyle'
    'python-requests'
    'python-xmltodict')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
