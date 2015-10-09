# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=3.18.0
pkgrel=1
pkgdesc="GTK3 document viewer, complete features, no gnome"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils'
         'gnome-icon-theme'
         'gsettings-desktop-schemas'
         'gtk3'
         'libsm'
         'libarchive'
         'poppler-glib'
         'libspectre'
         'djvulibre'
         'texlive-bin'
         'libgxps'
         'gvfs')
makedepends=('itstool' 'intltool')
provides=("${_pkgbname}")
conflicts=("${_pkgname}" "evince-light")
install="${pkgname}.install"
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
md5sums=('9f857c73be31ad053bc3b6e4ac10c428')

build()
{
cd ${srcdir}/${_pkgname}-${pkgver}

./configure \
     --sysconfdir=/etc \
     --prefix=/usr \
     --libexecdir=/usr/lib/${_pkgname} \
     --localstatedir=/var \
     --with-platform=gnome \
     --disable-debug \
     --disable-maintainer-mode \
     --disable-schemas-compile \
     --enable-viewer \
     --enable-previewer \
     --enable-thumbnailer \
     --enable-pdf \
     --enable-ps \
     --enable-djvu \
     --enable-dvi \
     --enable-xps \
     --enable-comics \
     --enable-t1lib \
     --enable-tiff \
     --disable-nautilus \
     --disable-browser-plugin \
     --disable-gtk-doc \
     --disable-introspection \
     --enable-dbus \
     --without-keyring \
     --with-gtk-unix-print \
     --disable-libgnome-desktop

make
}

package()
{
cd "${srcdir}/${_pkgname}-${pkgver}"

make DESTDIR="${pkgdir}" install
}
