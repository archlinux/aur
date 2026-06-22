# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-cozempic
_pkgname="${pkgname#python-}"
pkgver=1.8.34
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
sha256sums=('5a1cc6239c9eef533fab0b65b6da9e2f88f63ba3f2f06c4d7d2c6cfded95a9cf')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
