# $Id: PKGBUILD 256078 2015-12-14 20:36:26Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gst-validate
pkgver=1.12.0
pkgrel=0
pkgdesc="GStreamer Validate testing Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gstreamer' 'gst-plugins-base')
makedepends=('intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection' 'python3')
source=(${url}/src/gst-validate/gst-validate-${pkgver}.tar.xz)
sha256sums=('73efaf123638b97159c1ff6575dd05ea0cf7dc6d71b07806b5a5f25188a67fbb')

build() {
  cd "${srcdir}/gst-validate-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer Validate (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd "${srcdir}/gst-validate-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/gst-validate-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
