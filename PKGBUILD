# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=2.91.91.1
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop' 'gtk3' 'libcanberra' 'librsvg' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'clutter-gst'
         'clutter-gtk' 'libgee' 'gnome-video-effects' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'gnome-doc-utils' 'intltool' 'gobject-introspection')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.91/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('21e7c5c708dacd24df07d3c77789def9fb85941b8fb0023030d9074f912632fa')

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
