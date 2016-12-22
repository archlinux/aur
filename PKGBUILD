# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=evince
pkgname=${_pkgname}-light
pkgver=3.22.1
pkgrel=1
pkgdesc="GNOME document viewer, built with minimal dependencies"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnome-icon-theme'
         'gtk3'
         'libsm'
         'libarchive'
         'poppler-glib')
# Add to depends:
#        'libspectre' for PostScript
#        'djvulibre' for DJVU
#        'texlive-bin' for DVI
#        'libgxps' for XPS
#        'gvfs' for bookmark and annotations
makedepends=('itstool' 'intltool' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('f3d439db3b5a5745d26175d615a71dffa1535235b1e3aa0b85d397ea33ab231c')

build() {
    cd ${_pkgname}-${pkgver}

#        --enable-ps if building with libspectre
#        --enable-djvu if building with djvulibre
#        --enable-dvi if building with texlive-bin
#        --enable-xps if building with libgxps
#        --enable-comics if you want comics support

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
        --disable-ps \
        --disable-djvu \
        --disable-dvi \
        --disable-xps \
        --disable-comics \
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

package() {
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
}
