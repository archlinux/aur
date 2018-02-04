# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgbase='python-toytree'
pkgname=('python-toytree' 'python2-toytree')
pkgver=0.1.6
pkgrel=1
pkgdesc="A minimalist Python tree plotting library using toyplot graphs"
arch=('any')
url="http://toytree.readthedocs.io/"
license=('GPL3')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/eaton-lab/toytree/archive/"${pkgver}".tar.gz)
sha256sums=('aac078cd83ad1f4ebab8f48497e562cb52ea146f292d32df10fbf33d7248c740')

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
