# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=twspace-dl
pkgname="${_pkgname}-git"
pkgver=2023.1.22.1+16+gfc70941
_pkgver="${pkgver}.0"
pkgrel=1
pkgdesc="A python module to download twitter spaces."
arch=('any')
url="https://github.com/HoloArchivists/${_pkgname}"
license=('custom')
depends=('python')
makedepends=('git' 'python-poetry')
optdepends=()
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
