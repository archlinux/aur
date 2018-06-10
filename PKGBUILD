# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=lazy-property
pkgbase='python-lazy-property'
pkgname=('python-lazy-property' 'python2-lazy-property')
pkgver=0.0.1
pkgrel=1
pkgdesc="A Python package for making properties lazy"
arch=('any')
url=https://github.com/jackmaney/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('3a1cd36949b323468731ba569e169415a609d5904d53fffe982055fbe67b1180')

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

package_python2-lazy-property() {
  depends=('python2')

  cd "${_name}"-"${pkgver}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-lazy-property() {
  depends=('python')

  cd "${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
