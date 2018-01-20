# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgbase='python-toytree'
pkgname=('python-toytree' 'python2-toytree')
pkgver=0.1.4
pkgrel=2
pkgdesc="A minimalist Python tree plotting library using toyplot graphs"
arch=('any')
url="http://toytree.readthedocs.io/"
license=('GPL3')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/eaton-lab/toytree/archive/"${pkgver}".tar.gz)
sha256sums=('a2ecc1c4d54f22a2a4f8e713792c6377dc48e25daef26b38f479101b8e8ae306')

prepare() {
  cp -a toytree-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/toytree-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/toytree-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/toytree-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-toytree() {
  depends=('python2' 'python2-numpy' 'python2-toyplot')

  cd toytree-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-toytree() {
  depends=('python' 'python-numpy' 'python-toyplot')

  cd toytree-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
