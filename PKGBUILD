# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-zipremove
_pkgname="${pkgname/python-/}"
pkgver=0.9.2
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
sha256sums=('868c15bcb35df0c9eca456485c1e975b7d204a9e679e9677fb076079df990a55')

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
