# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=evolution-etesync-git
_pkgname=evolution-etesync
pkgver=r102.659c7c8
pkgrel=1
pkgdesc="EteSync (end-to-end encrypted sync) plugin for Evolution"
arch=(x86_64)
url="https://gitlab.gnome.org/nourmat/evolution-etesync/"
license=('LGPL')
depends=(libgee json-glib evolution-data-server evolution etesync-git)
makedepends=(cmake meson ninja vala git)
makedepends=('intltool')
source=("${_pkgname}::git+https://gitlab.gnome.org/nourmat/evolution-etesync.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
