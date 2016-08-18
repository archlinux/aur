# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgbase=evince
pkgname=evince-light
pkgver=3.20.1
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
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/${pkgver%.*}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('fc7ac23036939c24f02e9fed6dd6e28a85b4b00b60fa4b591b86443251d20055')

build()
{
    cd ${srcdir}/${pkgbase}-${pkgver}

#        --enable-ps if building with libspectre
#        --enable-djvu if building with djvulibre
#        --enable-dvi if building with texlive-bin
#        --enable-xps if building with libgxps
#        --enable-comics if you want comics support

    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgbase} \
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

package_evince-light()
{
    cd "${srcdir}/${pkgbase}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
