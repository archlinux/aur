# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyvoro-mmalahe
pkgname=python-${_base}
pkgdesc="2D and 3D Voronoi tessellations: a python entry point for the voro++ library"
pkgver=1.3.4
pkgrel=1
arch=(x86_64)
url="https://github.com/mmalahe/${_base%%-*}"
license=('custom')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('05bcf82e12610a56378832e90505f0317c907b6b00212559936e7d76df3787248bf054e64608641e9c66d77a25b26076c05e1e8399ab0788970622fb09f9bb75')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${pyversion}/${_base}" python setup.py test
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
