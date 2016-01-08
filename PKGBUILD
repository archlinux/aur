# $Id: PKGBUILD 256078 2015-12-14 20:36:26Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gst-validate
pkgver=1.6.0
pkgrel=0
pkgdesc="GStreamer Validate testing Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gstreamer' 'gst-plugins-base')
makedepends=('intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection' 'python2')
source=(${url}/src/gst-validate/gst-validate-${pkgver}.tar.xz)
sha256sums=('3baef8c7b5363293c20314a30afd54629849fc597669991fdcf92303602dafee')

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
