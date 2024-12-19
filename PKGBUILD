# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

pkgname=gdbuspp
pkgver=3
pkgrel=1
pkgdesc='GDBus++ - a glib2 D-Bus wrapper for C++ '
arch=('x86_64' 'aarch64')
url="https://codeberg.org/OpenVPN/${pkgname}"
license=('AGPL-3.0-only')
depends=(
  'glib2>=2.56'
)
makedepends=(
  'meson'
)
source=(
  "https://swupdate.openvpn.net/community/releases/gdbuspp-${pkgver}.tar.xz"
)
sha256sums=(
  'c7a053a13c4eb5811a542b747d5fcdb3a8e58a4a42c7237cc5e2e2ca72e0c94e'
)

prepare() {
  meson subprojects download --sourcedir="gdbuspp-${pkgver}"
}

build() {
  arch-meson "gdbuspp-${pkgver}" _builddir
  meson compile -C _builddir
}

package() {
  meson install -C _builddir --destdir "$pkgdir"
}
