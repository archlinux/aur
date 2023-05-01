# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=twspace-dl
pkgver=2023.1.22
_pkgver="${pkgver}.0"
pkgrel=1
pkgdesc="A python module to download twitter spaces."
arch=('any')
url="https://github.com/HoloArchivists/twspace-dl"
license=('custom')
depends=('python')
makedepends=('git' 'python-poetry')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('029d1f7b88eeb05aaf02b38dcc447b259f7e32b461535ce873cd3fad066a0b9d')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
