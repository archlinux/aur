# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=iwqt
pkgver=0.0.4
pkgrel=1
pkgdesc="An iwd network applet for linux systems"
url="https://github.com/FinGu/iwqt"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('iwd' 'qt6-base' 'qt6-svg' 'sdbus-cpp' 'gcc-libs' 'glibc')
makedepends=('meson' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FinGu/iwqt/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fc136b50afc5d049ab61f37066a9a6d905f48cd9753e73355121429d967fd9561d65b8705b1fdf5c155f563bbc4e9562e26cf778e3c6ec36bcb88bf6213c633e')

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
