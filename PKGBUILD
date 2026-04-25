# Maintainer: MrHaku81 <haku81.kk@gmail.com>
pkgname=disc-printer
pkgver=0.1.0
pkgrel=1
pkgdesc='A universal disc label editor for Linux — printer brand independent, supports CD/DVD/Blu-ray'
arch=('any')
url='https://github.com/MrHaku81/disc-printer'
license=('MIT')
depends=(
  'python>=3.11'
  'python-gobject'
  'python-cairo'
  'cups'
  'python-numpy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'gettext'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MrHaku81/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1ab5e4e97c5b7667faa2dd851ab3de42c70d173ce0f24831a1f26e31d609397')

build() {
  cd "${pkgname}-${pkgver}"
  make compile-mo
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
