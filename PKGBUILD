# Original maintainer: Stuart Mumford <stuart@cadair.com>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-yt
_module_name=yt
pkgver=4.4.2
pkgrel=1
pkgdesc="A community-developed analysis and visualization toolkit for volumetric data."
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=(
    'python-cmyt'
    'python-ewah-bool-utils'
    'python-matplotlib'
    'python-more-itertools'
    'python-numpy'
    'python-pillow'
    'python-sympy'
    'python-tomli-w'
    'python-tqdm'
    'python-typing_extensions'
    'python-unyt'
)
makedepends=(
    'cython'
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'jupyterlab: interactive analysis'
    'openmp: multithred support'
    'python-astropy: reading FITS files'
    'python-f90nml: reading RAMSES namelist files'
    'python-mpi4py: parallelism support'
    'python-netcdf4: read netCDF-backed datasets'
    'python-pandas: support downloading sample datasets '
    'python-pooch: support downloading sample datasets'
    'python-scipy: KDtree-accelerated spatial indexing'
    'python-xarray: input/output to xarray format'
    'python-glue: input/output to glueviz format'
)
options=(!emptydirs)
source=("https://pypi.io/packages/source/y/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('e0883a89c2543b436c3778f555edf253c71f252f744752dc1688f8524ad03b0b')

build() {
  cd "$srcdir/${_module_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
