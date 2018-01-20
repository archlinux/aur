# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgbase='python-toyplot'
pkgname=('python-toyplot' 'python2-toyplot')
pkgver=0.16.0
pkgrel=1
pkgdesc="A modern Python plotting toolkit supporting electronic publishing and reproducibility"
arch=('any')
url="http://toyplot.readthedocs.io/"
license=('custom:sandia')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/eaton-lab/toyplot/archive/"${pkgver}".tar.gz)
sha256sums=('fc181b875ce6bd36c2e8ba79f5c409500a8f7d1f82ac36bf36fa3f3d6b578f3a')

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
  depends=('python')

  cd toyplot-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-toyplot() {
  depends=('python')

  cd toyplot-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
