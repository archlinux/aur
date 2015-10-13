# Maintainer: Nicola Squartini <tensor5@gmail.com>

pkgname=evince-browser-plugin
pkgver=3.18.0
pkgrel=1
pkgdesc='Document viewer - browser plugin'
url='https://wiki.gnome.org/Apps/Evince'
arch=(i686 x86_64)
license=(GPL)
depends=(evince gst-plugins-base-libs)
makedepends=(itstool libnautilus-extension texlive-bin intltool gobject-introspection docbook-xsl python)
groups=(gnome)
source=("http://ftp.gnome.org/pub/gnome/sources/evince/${pkgver:0:4}/evince-${pkgver}.tar.xz")
sha256sums=('96e8351f6a6fc5823bb8f51178cde1182bd66481af6fb09bf58a18b673cafa70')

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
