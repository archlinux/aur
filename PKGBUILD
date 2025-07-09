# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=iwqt
pkgver=0.0.2
pkgrel=1
pkgdesc="An iwd network applet for linux systems"
url="https://github.com/FinGu/iwqt"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('iwd' 'qt6-base' 'sdbus-cpp')
makedepends=('meson' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FinGu/iwqt/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8f4421d35ea465dff4232962b1ad4485dede2e043565d6108beaceb20b2f470d233f2ea94d1b41faa3660f3e8ca96c7b15d846c3e94a774171142b0214ec672c')

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
