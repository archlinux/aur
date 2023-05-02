_base=ete3
pkgname=python-${_base}
pkgver=3.1.3
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
sha512sums=('77edc8092bc8900d56a95f813f0d66c1d894726bebfea91cc3edaf2fa62560e06b9ede6fe4c346d65cc01a53587b29cddb65b971a72ba3965514fae45374076d')

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
