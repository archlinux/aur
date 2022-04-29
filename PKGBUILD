# Original maintainer: Stuart Mumford <stuart@cadair.com>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-yt
_module_name=yt
pkgver=4.0.3
pkgrel=1
pkgdesc="A community-developed analysis and visualization toolkit for volumetric data."
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=('python-numpy' 'python-matplotlib' 'python-sympy' 'python-unyt' 'python-cmyt')
makedepends=('cython')
optdepends=(
    'jupyter'
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
sha256sums=('3f697bd8027b8fd0fc9c3485c5cd9e4e23462ce81e6e7d72f1431222fc12ed51')

build() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
