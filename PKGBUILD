# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.8.0
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk3' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'clutter-gst' 'clutter-gtk' 'libcanberra' 'gnome-video-effects' 'librsvg' 'gnome-desktop' 'nautilus-sendto' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection' 'itstool' 'vala')
optdepends=('frei0r-plugins: More camera effects')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('4e6f8c46ac6a2f80d0e8d540f582df1d5e2f67c59650cde0d60b837f5c779d9e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
