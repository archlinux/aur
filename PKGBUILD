# Maintainer: Noah Vogt <noah@noahvogt.com>
# Based on libva-v4l2_request by Vasily Khoruzhick <anarsoul@gmail.com>

pkgname=libva-v4l2_request-asahi
_pkgname=libva-v4l2_request
pkgver=1.3
pkgrel=2
pkgdesc='VA-API implementation for V4L2 stateless video decoders (Asahi fork with Apple AVD fixes)'
arch=(aarch64)
url=https://github.com/sofus13/libva-v4l2_request
license=(GPL-3.0-or-later)
depends=(
  glibc
  libva
  libdrm
)
makedepends=(
  git
  linux-api-headers
  meson
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/sofus13/libva-v4l2_request.git#tag=${pkgver}")
b2sums=('08def9056d9d97e1cac1f5ee7d4819c14957819e2c31e5d9b70d0acd940d2d4ee384f0c06202326b834bc9b411233d51ca595cbae9039c54605128bd90a250c0')

build() {
  arch-meson "${_pkgname}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 "${srcdir}/${_pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
