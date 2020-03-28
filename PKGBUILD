# Maintainer: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=3.36.0
pkgrel=1
pkgdesc="GTK3 document viewer, complete features, no gnome dependencies"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'gtk3' 'libgxps' 'libspectre' 'poppler-glib' 'djvulibre' 'gsettings-desktop-schemas' 'gspell' 'libarchive' 'gst-plugins-base-libs' 'libsynctex')
makedepends=('itstool' 'texlive-bin' 'gobject-introspection' 'intltool' 'docbook-xsl' 'python' 'gtk-doc' 'gnome-common' 'appstream-glib')
optdepends=('texlive-bin: DVI support'
            'gvfs: for session saving and bookmarking')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "evince-light")
options=('!emptydirs')
source=("https://download.gnome.org/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('851d9b5234d479ab4c8f7c5cbaceb0e91ad79ccba1a7b733cde72dacc928fba8')

build() {
cd ${_pkgname}-${pkgver}
BROWSER_PLUGIN_DIR=/usr/lib/epiphany/plugins \

./configure --prefix=/usr \
  --sysconfdir=/etc \
  --localstatedir=/var \
  --libexecdir=/usr/lib/${_pkgname} \
  --disable-static \
  --enable-compile-warnings=minimum \
  --disable-introspection \
  --disable-nautilus \
  --enable-pdf \
  --enable-ps \
  --enable-tiff \
  --enable-djvu \
  --enable-dvi \
  --enable-t1lib \
  --enable-comics \
  --enable-gtk-doc \
  --enable-multimedia \
  --disable-schemas-compile \
  --enable-dbus \
  --without-keyring \
  --disable-libgnome-desktop \
  --disable-browser-plugin

make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="$pkgdir" install
}
