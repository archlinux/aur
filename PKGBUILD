# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=gffutils
pkgbase='python-gffutils'
pkgname=('python-gffutils' 'python2-gffutils')
pkgver=0.9
pkgrel=3
pkgdesc="GFF and GTF file manipulation and interconversion in Python"
arch=('any')
url="https://pypi.python.org/pypi/gffutils"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/b4/ea/54ca403a8d471849606fb432b9afcf73c8c5105ea2dd87b8d38bd5217c5a/gffutils-0.9.tar.gz)
sha256sums=('e1b0bf2b422ec3491be13d77bf7baf71d274abd844e8f8b6c1217a95b236218b')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-gffutils() {
  depends=(
    'python2'
    'python2-argcomplete'
    'python2-argh'
    'python2-pyfaidx'
    'python2-simplejson'
    'python2-six')
  optdepends=(
    'bedtools: for genomic interval arithemtic'
    'python2-biopython: for sequence manipulation'
    'python2-pybedtools: wrapper for bedtools')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  mv "${pkgdir}"/usr/bin/"${_name}"-cli "${pkgdir}"/usr/bin/"${_name}"-cli2
}

package_python-gffutils() {
  depends=(
    'python'
    'python-argcomplete'
    'python-argh'
    'python-pyfaidx'
    'python-simplejson'
    'python-six')
  optdepends=(
    'bedtools: for genomic interval arithemtic'
    'python-biopython: for sequence manipulation'
    'python-pybedtools: wrapper for bedtools')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
