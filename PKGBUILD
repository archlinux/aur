# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=cruzdb
pkgbase='python-cruzdb'
pkgname=('python2-cruzdb')
pkgver=0.5.6
pkgrel=3
pkgdesc="Pythonic interface to the bioinformatics UCSC genome databses"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('MIT')
makedepends=(
#  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  https://raw.githubusercontent.com/brentp/"${_name}"/master/LICENSE
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/07/bd/af49692ea709c50da87b2532bf067b42b27efad5f2939e870cdb8c0ee3b9/cruzdb-0.5.6.tar.gz
)
sha256sums=(
  '495dc89f2efd71124650d0baeb8d5595af084f6979337e6fb8e9ef7e88adc5d6'
  'db53459768b35daa1c0f7f0dd16796d51e1ff3a1558962bfc20fab1f0a14c7f4'
)

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  # cd "${srcdir}"/"${_name}"-"${pkgver}"
  # python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-cruzdb() {
  depends=('python2' 'mysql-python' 'python2-six' 'python2-sqlalchemy')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

# package_python-cruzdb() {
#   depends=('python' 'mysql-python' 'python-six' 'python-sqlalchemy')

#   install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
#   cd "${_name}"-"${pkgver}"
#   python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
# }
