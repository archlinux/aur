# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>

pkgbase=evince
pkgname=evince-light
pkgver=3.16.1
pkgrel=2
pkgdesc="GNOME document viewer, built with minimal dependencies"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils'
         'gnome-icon-theme'
         'gsettings-desktop-schemas'
         'gtk3'
         'libsm'
         'libarchive')
# Add to depends:
#        'poppler-glib' for PDF
#        'libspectre' for PostScript
#        'djvulibre' for DJVU
#        'texlive-bin' for DVI
#        'libgxps' for XPS
#        'gvfs' for bookmark and annotations
makedepends=('itstool' 'intltool')
provides=("${pkgbase}")
conflicts=("${pkgbase}")
install=${pkgbase}.install
source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/${pkgver%.*}/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('06ff75065b2a30cd588c402f6bd2ea88ee3166181805e0cc00bd54f71dbf6130')

build()
{
    cd ${srcdir}/${pkgbase}-${pkgver}

#        --enable-pdf if building with poppler-glib
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
        --disable-pdf \
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
