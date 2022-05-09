pkgname=gimp-devel-stripped
pkgver=2.99.10
pkgrel=1
pkgdesc='GNU Image Manipulation Program (development version, stripped from most unnecessary dependencies)'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('gtk3' 'babl' 'gegl' 'glib-networking' 'mypaint-brushes1' 'poppler-data' 'appstream-glib')
makedepends=('intltool' 'iso-codes' 'gobject-introspection')
options=('!emptydirs' '!docs')

_name="${pkgname%-devel-stripped}"
_snapshot="${_name}-${pkgver}"

conflicts=("${_name}")
provides=("${_name}")

source=("${_snapshot}.tar.bz2::https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_snapshot}.tar.bz2")
sha256sums=('9e08f1c4a455e8dd4dd0579fe289419e38c835db38e3c0d40cd1137fb0112f29')

build() {
    cd "${srcdir}/${_snapshot}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/bin \
        --enable-default-binary \
        --enable-mp \
        --disable-alsatest \
        --disable-check-update \
        --disable-dependency-tracking \
        --disable-gi-docgen \
        --disable-gimp-console \
        --disable-glibtest \
        --disable-gtk-doc \
        --disable-gtktest \
        --disable-maintainer-mode \
        --disable-python \
        --disable-vala \
        --without-aa \
        --without-alsa \
        --without-appdata-test \
        --without-cairo-pdf \
        --without-gs \
        --without-gudev \
        --without-javascript \
        --without-jpeg2000 \
        --without-jpegxl \
        --without-libbacktrace \
        --without-libheif \
        --without-libmng \
        --without-libtiff \
        --without-libunwind \
        --without-libxpm \
        --without-linux-input \
        --without-lua \
        --without-openexr \
        --without-python \
        --without-print \
        --without-vala \
        --without-webp \
        --without-wmf \
        --without-xmc \
        --without-xvfb-run

    make
}

package() {
    cd "${srcdir}/${_snapshot}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/share/man"
    ln -s "gimptool-${pkgver%.*}" "${pkgdir}/usr/bin/gimptool"
}
