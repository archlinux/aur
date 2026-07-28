# Maintainer: Andy Alt <arch_stanton5995@proton.me>

pkgname=mesonfe
pkgver=0.1.2
pkgrel=1
pkgdesc='PyQt5 GUI frontend for the Meson build system'
arch=('any')
url='https://github.com/andy5995/mesonfe'
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'meson'
  'python-platformdirs'
  'python-pyqt5'
)
makedepends=('gettext')
checkdepends=(
  'python-pytest'
  'ruff'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andy5995/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('236b49bb476e44f4085b2b8192b2e5c200991cbc1d659a32bd65e65b2d344b2c')

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
