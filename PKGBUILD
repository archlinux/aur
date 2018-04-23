# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Kyle Meyer <kyle@kyleam.com>

_name=palettable
pkgbase='python-palettable'
pkgname=('python-palettable' 'python2-palettable')
pkgver=3.1.0
pkgrel=2
pkgdesc="Color palettes for Python"
arch=('any')
url=https://pypi.org/project/palettable
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
replaces=('python-brewer2mpl')
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/jiffyclub/palettable/d267e4aa8f746ab800d4998e670d60eca13f32cd/license.txt
)
sha256sums=(
  '4c6f6531b93d97eb0bf4d707160626261de11470c47e2d017ac6bb569b5308aa'
  '06982353629cfa6b7b339fa4cfccd6eca5a4434d5caefb7c32e68baa41a1be7c'
)

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-palettable() {
  depends=('python2' 'python2-matplotlib')

  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/license.txts
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-palettable() {
  depends=('python' 'python-matplotlib')

  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/license.txts
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
