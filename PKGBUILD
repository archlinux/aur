pkgname=gimp-stripped
pkgver=2.10.32
pkgrel=1
pkgdesc='GNU Image Manipulation Program (stripped from most unnecessary dependencies)'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('gtk2' 'babl' 'gegl' 'glib-networking' 'mypaint-brushes1' 'poppler-data')
makedepends=('intltool' 'iso-codes')
options=('!emptydirs' '!docs')

_name="${pkgname%-stripped}"
_snapshot="${_name}-${pkgver}"

conflicts=("${_name}")
provides=("${_name}")

source=("${_snapshot}.tar.bz2::https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_snapshot}.tar.bz2")
sha256sums=('3f15c70554af5dcc1b46e6dc68f3d8f0a6cc9fe56b6d78ac08c0fd859ab89a25')

build() {
    cd "${srcdir}/${_snapshot}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/bin \
        --enable-mp \
        --disable-alsatest \
        --disable-check-update \
        --disable-dependency-tracking \
        --disable-gimp-console \
        --disable-glibtest \
        --disable-gtk-doc \
        --disable-gtktest \
        --disable-maintainer-mode \
        --disable-python \
        --without-aa \
        --without-alsa \
        --without-appdata-test \
        --without-cairo-pdf \
        --without-gs \
        --without-gudev \
        --without-jpeg2000 \
        --without-libbacktrace \
        --without-libheif \
        --without-libmng \
        --without-libtiff \
        --without-libunwind \
        --without-libxpm \
        --without-linux-input \
        --without-openexr \
        --without-print \
        --without-webkit \
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
    ln -s "gimptool-2.0" "${pkgdir}/usr/bin/gimptool"
}
