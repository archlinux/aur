# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-zipremove
_pkgname="${pkgname/python-/}"
pkgver=0.8.2
pkgrel=1
pkgdesc='Extends `zipfile` with `remove`-related functionalities'
arch=('any')
url='https://github.com/danny0838/zipremove'
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3368d767467310ab95ad7a047eff24cf59094632a75e3440786c4e417f87e443')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.txt
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
