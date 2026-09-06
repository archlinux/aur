# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-wassima
_pkgname="${pkgname/python-/}"
pkgver=2.1.4
pkgrel=1
pkgdesc='No more certifi! System trust store at hand. In Pure Python.'
arch=('any')
url='https://github.com/jawah/wassima'
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('934907cc325e793e05bfdf79226bc7c69eaf8ed5a149ee8a6413ab326aaa91c5')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" {CHANGELOG,README,SECURITY}.md NOTICE
}
