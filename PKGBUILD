# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Ista Zahn <istazahn@gmail.com>

pkgname=python-mpl-scatter-density
_name=mpl_scatter_density
pkgver=0.8
pkgrel=1
pkgdesc="Fast scatter density plots for Matplotlib"
arch=('any')
url="https://github.com/astrofrog/mpl-scatter-density"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-astropy'
  'python-fast-histogram'
  'python-matplotlib'
  'python-numpy'
  'python-pyqt5'
  'python-pytest'
)
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
)
checkdepends=(
  'python-pytest-cov'
  'python-pytest-mpl'
)
source=("https://files.pythonhosted.org/packages/f1/8c/f5c1ddc7d35f0337b2698b52e60f558db3bf03e80ec0b13b8f8b9e2cf2e8/${_name}-${pkgver}.tar.gz")
sha512sums=('49bf2ac511fbf2a1f824e667b011246ebbbd272d3be9d14c4be5221a75b34568e71142b9a0cd11d956b2519b1326fa65b33eb77458c411af0f4a8e2873c9f81a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # Install the license file
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
