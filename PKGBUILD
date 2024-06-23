# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='python-brick-james'
_pkgname=brick_james
#pkgname='python-brick'
#_pkgname='brick'
pkgver=0.2.3
pkgrel=1
pkgdesc='Bayesian R-Matrix Inference Code Kit'
url='https://pypi.org/project/brick-james/'
provides=('python-brick' 'brick')
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-numpy'
  'python-matplotlib'
)
depends=(
  'python-jupyter-core'
  'python-corner'
  'python-seaborn'
  'python-lmfit'
  'python-multiprocess'
  'python-tqdm'
  'ipython'
  'azure2'
)
source=(
  "https://files.pythonhosted.org/packages/00/4c/3d1682432744d06f66b817bbcdb9c992bb3ba4feb1edfcd5dbd4284efb13/${_pkgname}-${pkgver}.tar.gz"
  "pyproject.patch"
)
sha256sums=(
  '0649c11a48b70ff7fd849f4d6a12fc05d77ece8e170643ebaad658f4d3ba1102'
  '5f64716da0e25d66a01772ff8b50e11380e4503eb6654228d9eba205a1341b12'
)

prepare() {
  cd "${srcdir}"
  patch -Np0 -i pyproject.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
