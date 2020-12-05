# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=evolution-etesync-git
_pkgname=evolution-etesync
pkgver=1.0.0.r5.gc90f7d8
pkgrel=2
pkgdesc="EteSync (end-to-end encrypted sync) plugin for Evolution"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/evolution-etesync/"
license=('LGPL')
depends=(libgee json-glib evolution-data-server evolution libetebase)
makedepends=(cmake meson ninja vala git intltool)
provides=(evolution-etesync)
conflicts=(evolution-etesync)
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/evolution-etesync.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname"
  cd build
  make DESTDIR="${pkgdir}" install
}
