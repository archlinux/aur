# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=custom_inherit
pkgbase='python-custom_inherit'
pkgname=('python-custom_inherit' 'python2-custom_inherit')
pkgver=2.2.0
pkgrel=1
pkgdesc="A Python package that provides tools for inheriting docstrings in customizable ways"
arch=('any')
url="https://github.com/meowklaski/custom_inherit"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/meowklaski/custom_inherit/13bce675e246d84e21bcd7658e0a4fbf25db4adc/License.md
)
sha256sums=(
  '3892ec53aaffae98d757867c3d1dd5f02200db0e1f888ab601223d72262996f8'
  '3ec37cf6e3bd177bf8661a0cd5f5d59b9955700a70bfd5ff12bd30d6d12ca95e'
)

prepare() {
  cp -a custom_inherit-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/custom_inherit-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/custom_inherit-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/custom_inherit-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-custom_inherit() {
  depends=('python2')

  install -Dm644 License.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/License.md
  cd custom_inherit-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-custom_inherit() {
  depends=('python')

  install -Dm644 License.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/License.md
  cd custom_inherit-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
