# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-isocodes
_pkgname=${pkgname#python-}
pkgver=2026.9.2
pkgrel=1
pkgdesc="Provides lists of various ISO standards (e.g. country, language, language scripts, and currency names) in one place"
arch=('any')
url="https://github.com/Atem18/isocodes"
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b05331432cf8fde703588eec242915a8189550f0c883cedc286d4441ac63de3d')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
