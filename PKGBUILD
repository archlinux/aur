# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=ete3
pkgname=python-${_base/3/}
pkgver=3.1.2
pkgrel=1
pkgdesc="A Python Environment for (phylogenetic) Tree Exploration"
arch=('any')
url="http://${_base/3/}toolkit.org"
license=(GPL)
depends=(python-six)
makedepends=(python-setuptools)
optdepends=(
  'python-lxml: Nexml and Phyloxml support'
  'python-numpy: ArrayTable and ClusterTree class support'
  'python-pyqt5: tree visualization and image rendering'
)
# options=(!emptydirs)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('e21d47ff4ec0f7669beb88e9526b33fed7c802e610277c2e09436e54b127b06439c49b4ad82316fe1e08bc0a40635b822949ec51f60b1ab2d604069988a212a4')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
