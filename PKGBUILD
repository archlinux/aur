# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pylev
pkgbase='python-pylev'
pkgname=('python-pylev' 'python2-pylev')
pkgver=1.2.0
pkgrel=1
pkgdesc="A pure Python Levenshtein implementation that's not freaking GPL'd"
arch=('any')
url=https://github.com/toastdriven/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('0187706ab2fa9db9f1bf4976b5f8a1fc69f04e005f535672147da9c79669bfa1')

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

package_python2-pylev() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-pylev() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
