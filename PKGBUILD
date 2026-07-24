# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=iwqt
pkgver=0.0.5
pkgrel=1
pkgdesc="An iwd network applet for linux systems"
url="https://github.com/FinGu/iwqt"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('iwd' 'qt6-base' 'qt6-svg' 'sdbus-cpp' 'gcc-libs' 'glibc')
makedepends=('meson' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FinGu/iwqt/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('10e3f0f70406faa9c3baf93354288ad014cb4e2fa985ce68729e351dd3b6b28fec1d84c4f2cd8299a85060794f4241c1d9670f259cbd7f7f60ea3432865088b0')

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
