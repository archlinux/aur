_base=krylov
pkgname=python-${_base}
pkgdesc="Krylov subspace methods for Python"
pkgver=0.0.3
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-setuptools)
# checkdepends=(python-scipyx python-pytest-codeblocks python-matplotlib)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4f82df8f9e3c66505cb4fdc9c3e5ae97da4d07cb62f734bda1a7d4f84efecf6a32e69fd3c2d6b056c6889b371b067cac159d4d2ec6138c706b9d49d6cd2f3202')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
