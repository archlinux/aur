# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-cozempic
_pkgname="${pkgname#python-}"
pkgver=1.8.14
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
sha256sums=('9c983afaccc379f505a4c0d7012501b5a5a10f92c0f9d785cead0583600d3dfe')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
