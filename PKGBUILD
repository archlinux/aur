# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.6.2
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk3' 'gstreamer' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'clutter-gst' 'clutter-gtk' 'libcanberra' 'libgee' 'gnome-video-effects' 'librsvg' 'gnome-desktop')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection' 'itstool' 'vala' 'nautilus-sendto')
optdepends=('nautilus-sendto: Send snapshots'
            'frei0r-plugins: More camera effects')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('745262a0db7d0dbe973497a4f36dd4d85b8a42426d8f431e4b6898351ad6459e')

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
