# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_name=xskillscore
pkgname=python-${_name}
pkgver=0.0.26
pkgrel=2
epoch=
pkgdesc="metrics for verifying forecasts"
arch=("any")
url="https://github.com/xarray-contrib/${_name}"
license=('Apache-2.0')
groups=()
depends=(
    "python"
    "python-dask"
    "python-numpy"
    "python-properscoring"
    "python-scipy"
    "python-statsmodels"
    "python-xarray>=0.16.1"
    "python-xhistogram>=0.3.0"
)
makedepends=(
    "python-build" "python-installer"  "python-wheel"
    "python-setuptools" "python-setuptools-scm"
)
checkdepends=(
    "python-pytest"
    "python-pytest-cov"
    "python-pytest-xdist"
    "python-bottleneck"
    "python-scikit-learn"
    "python-cftime"
    "python-numba>=0.52"
    "pre-commit"
)
optdepends=(
    "python-bottleneck: acceleration some numpy functions by rewritten them in C"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "change_tests_to_testing.patch"
    "fix_pyproject.patch"
)
noextract=()
sha256sums=(
    '879646d69eb15ec37e15cbd20b28b11a078bfa4abfac4f281fccfbecb0cb4510'
    '2c740be0e33c1732cca631fdfcf6c6c4d959c7fb58a5ab90544fd998d411653c'
    'ea539251d43b8788f28e8a675d09ca215537d13c9d44cc0fb82f0103b86ce323'
)
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
    patch -Np1 -i ../change_tests_to_testing.patch
    patch -Np1 -i ../fix_pyproject.patch
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
    # python setup.py build
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
    pytest
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # python setup.py install --root="$pkgdir" --optimize=1
}

