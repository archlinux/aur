# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.5.2
pkgrel=1
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
sha512sums=('d7813d9871aa464b186fc00ffe946a501d5de46af8c34a8bc960123f3d83811cbdacd509bd0efacee57adec9aef35419709900a35f0db9cbde54316a37873058')

build() {
  cd ${_base}-${pkgver}
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
