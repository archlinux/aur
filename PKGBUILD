# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=iwqt
pkgver=0.0.3
pkgrel=1
pkgdesc="An iwd network applet for linux systems"
url="https://github.com/FinGu/iwqt"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('iwd' 'qt6-base' 'qt6-svg' 'sdbus-cpp' 'gcc-libs' 'glibc')
makedepends=('meson' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FinGu/iwqt/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('cc8d0b3d90e949ab8f130c4b19048fafbffe5b987f0ee163d87ea44e68f92e8daa2d8e98c3954473dcec8045881a44376eb4a96d5ed8d0d3eda6df01267be311')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Currently no subprojects but leaving this here for conisistancy.
  meson subprojects download --sourcedir=.
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  arch-meson . build
  meson compile -C build
}

# no tests currently
# check() {
#   cd "${srcdir}/${pkgname}-${pkgver}"
#   meson test -C build
# }

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson install -C build --destdir "$pkgdir"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
