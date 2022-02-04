# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=1
pkgdesc="A framework for studying fluid dynamics using Python"
arch=('any')
url="https://foss.heptapod.net/${_base}/${_base}"
license=('custom:"CeCILL-B"')
depends=(python-matplotlib python-h5netcdf python-psutil python-distro python-qtpy)
optdepends=('python-pyfftw: Calculate FFT')
makedepends=(python-setuptools)
checkdepends=(python-pytest python-scipy ipython)
provides=(python-${_base})
conflicts=(python2-${_base}-hg)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('847a360fa4a23014d574272422715bad2c5bb32eae37f2c75d9a2194903720c73996d9bacfc3ab006243a746055cd8eecd2227ff0a5eb6a0f65310dc08bd5c3a')

build() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest -k 'not image'
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
