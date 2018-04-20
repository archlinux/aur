# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=toyplot
pkgbase='python-toyplot'
pkgname=('python-toyplot' 'python2-toyplot')
pkgver=0.17.0
pkgrel=1
pkgdesc="A modern Python plotting toolkit supporting electronic publishing and reproducibility"
arch=('any')
url="http://toyplot.readthedocs.io/"
license=('custom:sandia')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/sandialabs/toyplot/89a17d4b4ab39e7d02383426264119f523540859/LICENSE
)
sha256sums=(
  'f148123254336fcd05046f82ec6169a7d7a63f00211fbbccc43b9977468e6054'\
  '3f2c149ada89dc7874788fc3aee58ba5a1849fb2f44ba722f6a0a314b401c31f'
)

prepare() {
  cp -a toyplot-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/toyplot-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/toyplot-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/toyplot-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-toyplot() {
  depends=(
    'python2'
    'python2-arrow'
    'python2-custom_inherit'
    'python2-multipledispatch'
    'python2-numpy'
    'python2-reportlab'
    'python2-six'
  )

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd toyplot-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-toyplot() {
  depends=(
    'python'
    'python-arrow'
    'python-custom_inherit'
    'python-multipledispatch'
    'python-numpy'
    'python-reportlab'
    'python-six'
  )

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd toyplot-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
