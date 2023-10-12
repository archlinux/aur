# Original maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
_gitname=yt
pkgname=python-${_gitname}-git
pkgver=4.0.0.r2489.g7df628d03
pkgrel=3
pkgdesc="python package for data analysis and visualization"
url="http://yt-project.org"
arch=(any)
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
source=("git+https://github.com/yt-project/yt")
provides=('python-yt')
conflicts=('python-yt')
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${_gitname}"
    git clean -dfx
}

build() {
  cd "${srcdir}/${_gitname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^yt-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
