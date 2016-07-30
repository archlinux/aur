# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=atril
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.3
pkgrel=1
pkgdesc="MATE document viewer"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dconf' 'dbus' 'desktop-file-utils' 'glib2' 'gtk3' 'gtk-update-icon-cache' 
         'libsecret' 'libsm' 'libspectre' 'mate-desktop-1.15-gtk3' 'mathjax' 
         'poppler-glib' 'webkitgtk' 'zlib')
makedepends=('caja-1.15-gtk3' 'djvulibre' 'gtk-doc>=1.13' 'intltool>=0.50.1' 'gobject-introspection' 'libgxps'
             'texlive-bin' 'yelp-tools' 'webkit2gtk')
optdepends=('caja: Document Properties extension'
            'djvulibre: DjVu support'
            'libgxps: XPS support'
            'texlive-bin: DVI support'
            'yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('d13011111732e7db6196702e66183c19dd1828b4')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=3.0 \
        --enable-gtk-doc \
        --enable-djvu \
        --enable-dvi \
        --enable-epub \
        --enable-t1lib \
        --enable-pixbuf \
        --enable-comics \
        --enable-xps \
        --enable-introspection \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
