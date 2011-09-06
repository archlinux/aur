# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.1.91.1
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop' 'gtk3' 'libcanberra' 'librsvg' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-bad' 'clutter-gst'
         'clutter-gtk' 'mx' 'libgee' 'gnome-video-effects' 'hicolor-icon-theme' 'dconf')
makedepends=('pkgconfig' 'gnome-doc-utils' 'intltool' 'gobject-introspection')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('d29a0ee92f7877a10a9f834784e9f9239eaa51eb506b1fa47cd0619e98bb957b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper \
      --disable-static --disable-schemas-compile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
