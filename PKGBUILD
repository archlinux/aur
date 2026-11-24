# Maintainer: MrHaku81 <haku81.kk@gmail.com>
pkgname=disc-printer
pkgver=0.3.0
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
sha256sums=('c3c1cc9d91f0b33abb2146a4789292e74cbab987161cfede4b8fa0b4a731037b')

build() {
  cd "${pkgname}-${pkgver}"
  make compile-mo
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 flatpak/de.haku.disc-printer.desktop "${pkgdir}/usr/share/applications/de.haku.disc-printer.desktop"
  install -Dm644 flatpak/de.haku.disc-printer.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/de.haku.disc-printer.svg"
  install -Dm644 flatpak/de.haku.disc-printer.metainfo.xml "${pkgdir}/usr/share/metainfo/de.haku.disc-printer.metainfo.xml"
}
