# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=bcbio-gff
pkgbase='python-bcbio-gff'
pkgname=('python-bcbio-gff' 'python2-bcbio-gff')
pkgver=0.6.4
pkgrel=1
pkgdesc="Library to read and write Generic Feature Format"
arch=('any')
url=https://pypi.org/project/bcbio-gff/
license=('BSD')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/biopython/biopython/biopython-171/LICENSE.rst
)
sha256sums=(
  'e0efddc2376ed11b8f9682029b58bfd523a9aa62199f870b4ce64509ff99820b'
  '8bf4032e364a232f6afa3daa250b76dbd7a06b29fd9939351b34590ccc81f35d'
)

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-bcbio-gff() {
  depends=('python2' 'python2-six')

  install -Dm644 LICENSE.rst "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.rst
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-bcbio-gff() {
  depends=('python' 'python-six')

  install -Dm644 LICENSE.rst "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.rst
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
