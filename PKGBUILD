# Maintainer: Andy Alt <arch_stanton5995@proton.me>

pkgname=mesonfe
pkgver=0.1.1
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
checkdepends=(
  'python-pytest'
  'ruff'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andy5995/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4199f092300413afe16d5692f25af280aca6f0959ecc5e5584ee9d8372feab06')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup _build --prefix=/usr
  meson compile -C _build
}

check() {
  cd "${pkgname}-${pkgver}"
  meson test -C _build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C _build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
