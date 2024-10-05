# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

pkgname=gdbuspp
pkgver=2
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
  '0a3eab5c7f1f5ba803bec0902bb008b8c7a7040fdaf0e0e94b4ac77ffebf0bfd'
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
