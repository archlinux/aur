# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

pkgname=gdbuspp
pkgver=1
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
  'e53e47f8529109e138d59ff38374818692b6fe26f2fee2d00642bba272e117a3'
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
