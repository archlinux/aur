# Maintainer: Andy Alt <arch_stanton5995@proton.me>

pkgname=mesonfe
pkgver=0.1.0
pkgrel=1
pkgdesc='PyQt5 GUI frontend for the Meson build system'
arch=('any')
url='https://github.com/andy5995/mesonfe'
license=('GPL-3.0-or-later')
depends=(
  'meson'
  'python-pyqt5'
  'python-platformdirs'
  'hicolor-icon-theme'
)
makedepends=('gettext')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andy5995/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1021aaa404288d304c1d00a11fed2ccdda020dbf0c92e98d36588119d15846d')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup _build --prefix=/usr
  meson compile -C _build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C _build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
