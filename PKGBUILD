# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=libgudev-nosystemd-git
pkgver=234
pkgrel=1
pkgdesc="GObject bindings for libudev"
url="https://wiki.gnome.org/Projects/libgudev"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 libg{lib,object}-2.0.so libudev.so)
makedepends=(gobject-introspection gtk-doc git)
source=("git+https://gitlab.gnome.org/GNOME/libgudev.git")
sha256sums=('SKIP')

pkgver() {
  cd libgudev
  git describe --tags | sed 's/-/+/g'
}

#check() {
#  cd libgudev
#  make check
#}

build() {
  arch-meson libgudev build \
    -D tests=disabled \
    -D vapi=disabled \
    -D gtk_doc=false
  ninja -C build
}

package() {
  provides=(libgudev-1.0.so libgudev)
  conflicts=(libgudev)

  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
