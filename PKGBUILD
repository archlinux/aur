# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gmsh_interop
pkgname=python-${_base}
pkgdesc="Interoperability with Gmsh for Python"
pkgver=2024.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-pytools gmsh)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-pytest)
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('05f7c14f8ea5fb21552f6bcfc72e864f2e4c935c2864b8431657c4d8db68289736e44e43091f9a161e31f3c434aee5ff8496f5d591cd63241f94640f44944e56')

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
