# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=gff3
pkgbase='python-gff3'
pkgname=('python-gff3' 'python2-gff3')
pkgver=0.3.0
pkgrel=2
pkgdesc="Manipulate genomic features and validate the syntax and reference sequence of GFF3 files"
arch=('any')
url="https://pypi.python.org/pypi/gff3"
license=('BSD')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/e1/9d/22b29188092d5c51e80181b6e0e880cf04fafb4387bd84a7d8c16b7cfe66/gff3-0.3.0.zip)
sha256sums=('14bd20f0fd94386a2848f1af768c2af1bb6dfc9bdc4e433dff0bbc7c15abc245')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-gff3() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}

package_python-gff3() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
