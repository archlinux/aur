# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-glib-networking
pkgver=2.70.1
pkgrel=1
pkgdesc='Network-related giomodules for glib'
arch=(x86_64)
url=https://git.gnome.org/browse/glib-networking/
license=(GPL2)
depends=(
  glib-networking
  lib32-glib2
  lib32-gnutls
  lib32-libproxy
)
makedepends=(
  git
  meson
)
checkdepends=(
  ca-certificates
)
_tag=b0d45b17f745088256c9ad1ae9a7e2467dec6286
source=(git+https://gitlab.gnome.org/GNOME/glib-networking.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd glib-networking

  git describe --tags
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config
  arch-meson glib-networking build --libdir=/usr/lib32
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  rm -rf "${pkgdir}"/usr/{lib,share}
}

# vim: ts=2 sw=2 et:
