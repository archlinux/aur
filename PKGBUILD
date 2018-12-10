# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=libgee-git
pkgver=0.20.1.r0.g57e4c8a
pkgrel=1
pkgdesc="A collection library providing GObject-based interfaces and classes for commonly used data structures"
url="https://git.gnome.org/browse/libgee"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(glib2)
makedepends=(gobject-introspection vala autoconf-archive git valadoc)
provides=(libgee)
conflicts=(libgee)
source=("git+https://git.gnome.org/browse/libgee")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname/-git/}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${pkgname/-git/}"
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "${pkgname/-git/}"
  # generates a bazillion traps - make sure systemd's core_pattern
  # is deactivated, or you'll DoS the journal and the system
  #make check
}

package() {
  cd "${pkgname/-git/}"
  make DESTDIR="$pkgdir" install
}
