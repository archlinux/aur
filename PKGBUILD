# Maintainer: Zdeněk Janeček <jan.zdenek@gmail.com>
pkgname=entangle
pkgver=1.0
pkgrel=1
pkgdesc="Entangle is an application which uses GTK and libgphoto2 to provide a graphical interface for tethered photography with digital cameras."
arch=('i686' 'x86_64')
url="http://entangle-photo.org/"
license=('GPL')
depends=('glib2>=2.26.0' 'dbus-glib>=0.60' 'gdk-pixbuf2>=2.12.0' 'gtk3' 'libgphoto2' 'libgudev' 'gobject-introspection' 'lcms2' 'libpeas' 'libgexiv2' 'libraw' 'adwaita-icon-theme' 'gstreamer' 'itstool')
makedepends=('intltool' 'meson' 'gtk-doc')
install=entangle.install
source=(http://entangle-photo.org/download/sources/$pkgname-$pkgver.tar.xz)
md5sums=('d9fb32a9bbaff3ef76d524c26d06fda1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  meson -Denable-gtk-doc=true build-dir --prefix=/usr
  ninja -C build-dir all
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ninja -C build-dir test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build-dir install
}
