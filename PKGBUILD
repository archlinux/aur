# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=2
pkgdesc="A framework for studying fluid dynamics using Python"
arch=(any)
url="https://foss.heptapod.net/${_base}/${_base}"
license=('custom:"CeCILL-B"')
depends=(python-matplotlib python-h5netcdf python-psutil python-distro python-qtpy)
optdepends=('python-pyfftw: Calculate FFT')
makedepends=(python-setuptools)
checkdepends=(python-pytest python-scipy ipython)
provides=(python-${_base})
conflicts=(python2-${_base}-hg)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('a581a20d06f7d43537dc7e1ec4b26022dfaa31e8eedcf07a1a72ff8ada396f042f468b2984e9cb76c5a349d83a7aba11496fdae669c73809d90d804a98e39d88')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest -k 'not image'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
