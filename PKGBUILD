# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gmsh_interop
pkgname=python-${_base}
pkgdesc="Interoperability with Gmsh for Python"
pkgver=2021.1.1
pkgrel=1
arch=('x86_64')
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-pytools gmsh)
makedepends=(python-setuptools git)
checkdepends=(python-pytest)
source=("git+https://github.com/inducer/${_base}.git?signed#tag=v${pkgver}")
validpgpkeys=('900A958D9A0ACA58B1468F2471AA298BCA171145') # Andreas Kloeckner
sha512sums=('SKIP')

build() {
  cd "${_base}"
  python setup.py build
}

check() {
  cd "${_base}"
  python -m pytest
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
