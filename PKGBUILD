# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=ete3
pkgbase='python-ete'
pkgname=('python-ete' 'python2-ete')
pkgver=3.1.1
pkgrel=2
pkgdesc="Python toolkit for building, comparing, annotating, manipulating and visualising phylogenetic trees"
arch=('any')
url=http://etetoolkit.org/
license=('GPL3')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/21/17/3c49b7fafe10ed63bb7904ebf9764b98db726aa5fd482fb006818854bc04/ete3-3.1.1.tar.gz)
sha256sums=('870a3d4b496a36fbda4b13c7c6b9dfa7638384539ae93551ec7acb377fb9c385')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-ete() {
  depends=('python2' 'python2-six')
  optdepends=(
    'python2-lxml: Nexml and Phyloxml support'
    'python2-numpy: ArrayTable and ClusterTree class support'
    'python2-pyqt4: tree visualization and image rendering'
    'python2-pyqt5: tree visualization and image rendering'
  )

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  mv "${pkgdir}"/usr/bin/"${_name}" "${pkgdir}"/usr/bin/"${_name}"-2
}

package_python-ete() {
  depends=('python' 'python-six')
  optdepends=(
    'python-lxml: Nexml and Phyloxml support'
    'python-numpy: ArrayTable and ClusterTree class support'
    'python-pyqt4: tree visualization and image rendering'
    'python-pyqt5: tree visualization and image rendering'
  )

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
