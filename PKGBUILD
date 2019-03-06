# Maintainer: Zdeněk Janeček <jan.zdenek@gmail.com>
pkgname=entangle
pkgver=2.0
pkgrel=2
pkgdesc="Entangle is an application which uses GTK and libgphoto2 to provide a graphical interface for tethered photography with digital cameras."
arch=('i686' 'x86_64')
url="http://entangle-photo.org/"
license=('GPL')
depends=('glib2>=2.26.0' 'dbus-glib>=0.60' 'gdk-pixbuf2>=2.12.0' 'gtk3>=3.22.0' 'libgphoto2>=2.4.11' 'libgudev' 'gobject-introspection' 'lcms2' 'libpeas' 'libgexiv2' 'libraw' 'adwaita-icon-theme' 'gstreamer' 'itstool' 'gst-plugins-base-libs')
makedepends=('intltool' 'meson' 'gtk-doc')
install=entangle.install
source=(http://entangle-photo.org/download/sources/$pkgname-$pkgver.tar.xz)
md5sums=('12049cc192bc1c9ec5fd668921061776')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/'libraw_r'/'raw_r'/g" meson.build
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
