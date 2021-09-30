# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyvoro-mmalahe
pkgname=python-${_base}
pkgdesc="2D and 3D Voronoi tessellations: a python entry point for the voro++ library"
pkgver=1.3.3
pkgrel=1
arch=('x86_64')
url="https://pypi.org/project/${_base}"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('bc94ec737acf72a3ab632fda24fd8163009ce27c9c3b60b819642ed29d20fef67df861265539fbb56b528173d77f647af21e190ad394c21a998968aa4f77c2cf')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   local pyversion=$(python -c "import sys; print(sys.version[:3])")
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${pyversion}/${_base%-mmalahe}" python setup.py test
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
