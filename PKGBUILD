# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=adjustText
pkgbase='python-adjusttext'
pkgname=('python-adjusttext' 'python2-adjusttext')
pkgver=0.7
pkgrel=1
pkgdesc=" A small library for automatically adjusting text position in matplotlib plots to minimize overlaps"
arch=('any')
url=https://github.com/meowklaski/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/Phlya/"${_name}"/"${pkgver}"/LICENSE
)
sha256sums=(
  '9343d42777b43a0383327b3124172a83a0a66926a386b7a87413f8e719b4b6bf'
  '443687f058d5f541952ab9bcd6f836d9843ac13b93b8a6b1097eb0832d2314fa'
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

package_python2-adjusttext() {
  depends=('python2' 'python2-matplotlib' 'python2-numpy')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-adjusttext() {
  depends=('python' 'python-matplotlib' 'python-numpy')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
