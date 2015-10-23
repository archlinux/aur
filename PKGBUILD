# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=evince-browser-plugin
pkgver=3.18.1
pkgrel=1
pkgdesc='Document viewer - browser plugin'
url='https://wiki.gnome.org/Apps/Evince'
arch=(i686 x86_64)
license=(GPL)
depends=(evince gst-plugins-base-libs)
makedepends=(itstool libnautilus-extension texlive-bin intltool gobject-introspection docbook-xsl python)
groups=(gnome)
source=("http://ftp.gnome.org/pub/gnome/sources/evince/${pkgver:0:4}/evince-${pkgver}.tar.xz")
sha256sums=('7b5023765e6d6fb98da582fe3adc4f268f87b2f35110634e12cdac40f7aa8c31')

build() {
  cd "${srcdir}/evince-${pkgver}"

  ./configure --prefix=/usr   --sysconfdir=/etc \
      --localstatedir=/var    --libexecdir=/usr/lib/evince \
      --disable-static        --enable-nautilus \
      --enable-pdf            --enable-tiff \
      --enable-djvu           --enable-dvi \
      --enable-t1lib          --enable-comics \
      --disable-scrollkeeper  --disable-schemas-compile \
      --enable-introspection
  make
}

package() {
  cd "${srcdir}/evince-${pkgver}"

  make -C browser-plugin DESTDIR="${pkgdir}" install
}
