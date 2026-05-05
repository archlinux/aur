# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-cozempic
_pkgname="${pkgname#python-}"
pkgver=1.8.6
pkgrel=1
pkgdesc="Context cleaning for Claude Code — prune bloated sessions, protect Agent Teams from context loss, auto-guard with tiered pruning"
arch=("any")
url="https://github.com/Ruya-AI/cozempic"
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6e72ea1e544dac2b4aa89f66c8f09a654330ef6c547ee3bc822f536b5458971c')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
