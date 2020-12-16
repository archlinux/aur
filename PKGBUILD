# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gdk-pixbuf2-git
pkgver=2.39.2+1+g3249c681f
pkgrel=1
pkgdesc="An image loading library"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/GdkPixbuf"
license=(LGPL2.1)
provides=(gdk-pixbuf2)
conflicts=(gdk-pixbuf2)
depends=(glib2 libpng libtiff libjpeg libx11 shared-mime-info)
makedepends=(gobject-introspection git meson)
install=gdk-pixbuf2.install
source=("git+https://gitlab.gnome.org/GNOME/gdk-pixbuf.git"
        gdk-pixbuf-query-loaders.hook)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gdk-pixbuf
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gdk-pixbuf
}

build() {
  arch-meson gdk-pixbuf build \
    -D docs=false \
    -D man=false \
    -D installed_tests=false
  ninja $NINJAFLAGS -C build
}

#check() {
#  cd build
  # pixbuf-randomly-modified fails randomly
#  meson test -t 3 || :
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}

# vim:set ts=2 sw=2 et:
