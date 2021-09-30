_base=cplot
pkgname=python-${_base}
pkgdesc="Color maps for complex-valued functions"
pkgver=0.5.1
pkgrel=3
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-colorio)
makedepends=(python-setuptools)
# checkdepends=(python-pytest-codeblocks) #python-mpmath python-scipy python-meshzoo
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('fe3b43f91071e5c47fcf3934871c34761d3c8214d4fd52ce820411b2672f95c0eca5858f124a1e0e633ade34c93de0e672e1479eb27ac2774d3f1a9aef9ed129')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
