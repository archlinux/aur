# Original maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Current maintainer: Corentin Cadiou <contact@cphyc.me>
_gitname=yt
pkgname=python-$_gitname-git
pkgver=4.0.0.r668.g03c41c0d9
pkgrel=2
pkgdesc="python package for data analysis and visualization"
url="http://yt-project.org"
arch=(any)
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
source=("git+https://github.com/yt-project/yt")
provides=('python-yt')
md5sums=(SKIP)

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^yt-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
