# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes-props
pkgver=1.13.0
pkgrel=1
pkgdesc="The fsleyes-props project is an event programming framework, which includes the ability for automatic CLI generation and, optionally, automatic GUI generation (if wxPython is present). It is used by FSLeyes."
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-deprecation' 'python-wxpython' 'fslpy>=3.27.0' 'fsleyes-widgets>=0.17.0' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://git.fmrib.ox.ac.uk/fsl/fsleyes/${pkgname#fsleyes-}/-/archive/${pkgver}/${pkgname#fsleyes-}-${pkgver}.tar.gz")
sha256sums=('9c3a0f2bcf11986925f0ec927c351934a3a529ed56b1b4cbf7db63ddb9889572')

build() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_fsleyes_props=${pkgver} python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname#fsleyes-}-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}
