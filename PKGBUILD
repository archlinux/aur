# Maintainer: Vasily Khoruzhick <anarsoul@gmail.com>

pkgname=libva-v4l2_request
pkgver=1.2
pkgrel=1
pkgdesc='VA-API implementation for V4L2 stateless video decoders'
arch=(x86_64 aarch64)
url=https://xff.cz/git/libva-v4l2_request/about/
license=(GPL-3.0-or-later)
depends=(
  glibc
  libva
  libdrm
  linux-headers
)
makedepends=(
  git
  meson
)
source=(libva-v4l2_request::git+https://xff.cz/git/libva-v4l2_request#tag=${pkgver})
b2sums=('3520f5ad8aa42f0ab89ad0c4b08b647afcdcaa3df1d4b9fe5772b959da627982bbae996afc8a87b76288e218758a1bd0b4431f177e5414e3bd8e2d0b1ccce8e9')

build() {
  arch-meson libva-v4l2_request build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 ${srcdir}/libva-v4l2_request/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
