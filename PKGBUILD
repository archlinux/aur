# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libgexiv2-git
pkgver=0.16.0.r6.g002edd1
pkgrel=1
pkgdesc='GObject-based wrapper around the Exiv2 library'
url='https://gitlab.gnome.org/GNOME/gexiv2'
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(exiv2 gcc-libs glib2 glibc python)
makedepends=(git glib2-devel gobject-introspection meson python-gobject vala)
conflicts=(libgexiv2)
provides=(libgexiv2)
source=("git+${url}")
b2sums=('SKIP')

pkgver() {
    cd "gexiv2"
    git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gexiv2 build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(
    libg{lib,object,io}-2.0.so
    libexiv2.so
  )

  meson install -C build --destdir "$pkgdir"
}

