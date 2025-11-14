# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_name=xhistogram
pkgname=python-${_name}
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="fast, flexible, label-aware histograms for numpy and xarray"
arch=("any")
url="https://github.com/xgcm/xhistogram"
license=('Apache-2.0')
groups=()
depends=("python" "python-numpy" "python-xarray" "python-dask")
makedepends=(
    "python-build" "python-installer"  "python-wheel"
    # "python-setuptools" "python-setuptools-scm"
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "versioneer.patch"
)
noextract=()
sha256sums=(
    'f46ea6af5ef3fbafb999f5ca3a99332f8296cb8f1f09dfffa2c599bfcaf7c5d2'
    '7e7da17ed7a0a2d0e25180600bdd5e4e0da191d72bb4af6c69702e5179c39adb'
)
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
    # scince python 3.12:
    # - class SafeConfigParser was instead by ConfigParser
    # - method readfd was instead by read_file
    patch -Np1 -i ../versioneer.patch
    # patch -Np1 -i ../fix_prod_arg.patch
    # patch -Np1 -i ../fix_reshape.patch
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
    # python setup.py build
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
    # pytest
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # python setup.py install --root="$pkgdir" --optimize=1
}

