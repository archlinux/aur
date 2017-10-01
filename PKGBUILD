# Maintainer: Joel <aullidolunar -at- gm41l d0t c0m>
# http://pub.mate-desktop.org/releases/1.19/atril-1.19.3.tar.xz

_majver=1.19
_minver=3
_pkgbase=atril
pkgname=(${_pkgbase}-nocaja-gtk2)
pkgver=${_majver}.${_minver}
pkgrel=1
pkgdesc="MATE document viewer without caja dependency (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('djvulibre' 'libspectre' 'libgxps' 'mathjax' 'poppler-glib' 'webkit2gtk')
makedepends=('gobject-introspection' 'intltool' 'itstool' 'texlive-bin')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_majver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('7b4b2493e39020120bb710da6fc25af81591b82e')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    # Fix mathjax path
    sed -i 's|/usr/share/javascript/mathjax|/usr/share/mathjax|' backend/epub/epub-document.c
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=2.0 \
        --enable-djvu \
        --enable-dvi \
        --enable-epub \
        --enable-t1lib \
        --enable-pixbuf \
        --enable-comics \
        --enable-xps \
        --enable-introspection \
        --disable-caja \
        --without-keyring \
        --disable-previewer \

   make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
