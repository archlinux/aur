# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=progressbar33
pkgbase='python-progressbar33'
pkgname=('python-progressbar33' 'python2-progressbar33')
pkgver=2.4
pkgrel=2
pkgdesc="Text progress bar library for Python"
arch=('any')
url="https://pypi.python.org/pypi/progressbar33"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/71/fc/7c8e01f41a6e671d7b11be470eeb3d15339c75ce5559935f3f55890eec6b/progressbar33-2.4.tar.gz)
sha256sums=('51fe0d9b3b4023db2f983eeccdfc8c9846b84db8443b9bee002c7f58f4376eff')

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

package_python2-progressbar33() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}

package_python-progressbar33() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}
