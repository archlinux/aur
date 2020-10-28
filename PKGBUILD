# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=evolution-etesync-git
_pkgname=evolution-etesync
pkgver=0.6.0.r176.91de4e3
pkgrel=1
pkgdesc="EteSync (end-to-end encrypted sync) plugin for Evolution"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/evolution-etesync/"
license=('LGPL')
depends=(libgee json-glib evolution-data-server evolution etebase)
makedepends=(cmake meson ninja vala git intltool)
source=("${_pkgname}::git+https://gitlab.gnome.org/nourmat/evolution-etesync.git#branch=EteSync-2.0")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # FIXME: change to this when there's a tag: git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "0.6.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
