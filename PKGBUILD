# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=gtfparse
pkgbase='python-gtfparse'
pkgname=('python-gtfparse' 'python2-gtfparse')
pkgver=0.0.6
pkgrel=2
pkgdesc="Python library for parsing GTF files"
arch=('any')
url="https://pypi.python.org/pypi/gtfparse"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/2a/e9/96b187f33a1ce4d31287cda09c3422b3a9439a4245699364e6f4c5bbf5b2/gtfparse-0.0.6.tar.gz)
sha256sums=('4e169a4dfb3b5a4eb4350a864e8435d7f7961c704b6c45cb0f540132f4e1d37e')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-gtfparse() {
  depends=('python2' 'python2-numpy' 'python2-pandas')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-gtfparse() {
  depends=('python' 'python-numpy' 'python-pandas')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
