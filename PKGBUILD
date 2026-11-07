# Maintainer: Noah Vogt <noah@noahvogt.com>
# Based on libva-v4l2_request by Vasily Khoruzhick <anarsoul@gmail.com>

pkgname=libva-v4l2_request-asahi
_pkgname=libva-v4l2_request
pkgver=2.0
pkgrel=1
pkgdesc='VA-API driver for V4L2 stateless video decoders on Apple Silicon (asahi-va-driver)'
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
conflicts=("${_pkgname}")
install="$pkgname.install"
source=("${_pkgname}::git+https://github.com/sofus13/libva-v4l2_request.git#tag=${pkgver}")
b2sums=('20cd1e8ac8821620e70d142971e8ca9a2445e5308d4ff4f844cabb72a7710ba7e6d24975ea14b542b6b5d9b9f6d3e9cdf94c47a90eefb3c73f20d79993c9d9f2')

build() {
  arch-meson "${_pkgname}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 "${srcdir}/${_pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
