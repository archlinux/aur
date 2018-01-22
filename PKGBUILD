# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=declxml
pkgbase='python-declxml-git'
pkgname=('python-declxml-git' 'python2-declxml-git')
pkgver=0.10.0.r0.gb59c66c
pkgrel=1
pkgdesc="Declarative XML processing for Python."
arch=('any')
url="https://pypi.python.org/pypi/declxml"
license=('MIT')
provides=('python-declxml')
conflicts=('python-declxml')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${_name}"-"${pkgver}"::git+https://github.com/gatkin/"${_name}".git)
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"-"${pkgver}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-declxml-git() {
  cd "${_name}"-"${pkgver}"-py2

  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-declxml-git() {
  cd "${_name}"-"${pkgver}"

  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
