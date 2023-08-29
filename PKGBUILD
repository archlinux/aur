# Original maintainer: Stuart Mumford <stuart@cadair.com>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-yt
_module_name=yt
pkgver=4.2.2
pkgrel=2
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
    'python-setuptools'
    'python-wheel'
    'python-ewah-bool-utils'
    'python-oldest-supported-numpy'
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
source=("https://pypi.io/packages/source/y/${_module_name}/${_module_name}-${pkgver}.tar.gz"
        "cython-3.patch")
sha256sums=('9a3a2ddf5ca30ca34b1c85465a70a0d4579d1fe834d07eaf9693b5ce7fdb9949'
            '77b66fed1befda2906160889c42752cda1b571a495d337d8af4f10d3291933ec')

prepare() {
  cd "$srcdir/${_module_name}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/cython-3.patch"
}

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
