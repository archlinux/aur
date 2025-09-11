# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gmsh_interop
pkgname=python-${_base}
pkgdesc="Interoperability with Gmsh for Python"
pkgver=2025.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-pytools gmsh)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-pytest)
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('817263866bf433e84abed9f04844b55f400c7a0b62c7c145b0cc15450539596d203958a1e001dafc7773add90af07a6897f00a8186a1ccb4762e4b8aa23ca993')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m pytest
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
