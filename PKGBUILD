# Maintainer: MrHaku81 <haku81.kk@gmail.com>
pkgname=disc-printer
pkgver=0.1.2
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
sha256sums=('6b65ac2d95cdb6d7a91c0aedc46a5c5ff39bb13320552c82973d96453f6ffaa3')

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
