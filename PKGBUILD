# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pylev
pkgbase='python-pylev'
pkgname=('python-pylev' 'python2-pylev')
pkgver=1.3.0
pkgrel=1
pkgdesc="A pure Python Levenshtein implementation that's not freaking GPL'd"
arch=('any')
url=https://github.com/toastdriven/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/toastdriven/pylev/v1.2.0/LICENSE
)
sha256sums=(
  '063910098161199b81e453025653ec53556c1be7165a9b7c50be2f4d57eae1c3'
  'd22084527e4de9dd864c5ce0b29cd9cff88566c4161dbc02f7e8d4569988c4ee'
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

package_python2-pylev() {
  depends=('python2')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-pylev() {
  depends=('python')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
