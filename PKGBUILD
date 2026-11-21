# Maintainer: MrHaku81 <haku81.kk@gmail.com>
pkgname=disc-printer
pkgver=0.2.0
pkgrel=1
pkgdesc='A universal disc label editor for Linux — printer brand independent, supports CD/DVD/Blu-ray'
arch=('any')
url='https://github.com/MrHaku81/disc-printer'
license=('MIT')
depends=(
  'python>=3.11'
  'python-gobject'
  'gtk4'
  'python-cairo'
  'cups'
  'python-numpy'
)
optdepends=(
  'python-pillow: sRGB colour profile in print output'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'gettext'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MrHaku81/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5b61ca48d2035e226fe0087ab582435e58782fdd711dadddba5ca23711d4def')

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
