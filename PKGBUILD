# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=atril
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.6
pkgrel=6
pkgdesc="MATE document viewer"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dconf' 'dbus' 'desktop-file-utils' 'glib2' 'gtk3' 'gtk-update-icon-cache' 
         'libsecret' 'libsm' 'libspectre' 'mate-desktop>=1.21' 'mathjax' 
         'poppler-glib' 'webkit2gtk' 'zlib')
makedepends=('caja>=1.21' 'djvulibre' 'gtk-doc>=1.13' 'intltool>=0.50.1' 'gobject-introspection' 'libgxps'
             'texlive-bin' 'yelp-tools' 'webkit2gtk')
optdepends=('caja: Document Properties extension'
            'djvulibre: DjVu support'
            'libgxps: XPS support'
            'texlive-bin: DVI support'
            'yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('f8ac79c1e4ba00780fb218a8e58e046a4e890c96')

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
