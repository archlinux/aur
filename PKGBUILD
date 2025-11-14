# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_name=cf-xarray
pkgname=python-${_name}
pkgver=0.10.9
pkgrel=1
epoch=
pkgdesc="A lightweight convenience wrapper for using CF attributes on xarray objects."
arch=('any')
url="https://github.com/xarray-contrib/cf-xarray"
license=('Apache-2.0')
groups=()
depends=("python" "python-xarray" "python-tzdata")
makedepends=("python-build" "python-installer" "python-setuptools")
checkdepends=("python-pytest")
optdepends=(
    "python-matplotlib: to enable pint's built-in matplotlib support"
    "python-pint: to provide unit support via approximating UDUNITS/CF"
    "python-pooch: to install cf standard name table from raw.githubusercontent.com" 
    "python-shapely: for conversion between shapely geometry objects and CF-compliant dataset"
    "python-regex: to instead of python official re module"
    "python-rich: for better console output"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
    pytest # can not test due to network requirement
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

