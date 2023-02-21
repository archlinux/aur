_name=gimp
pkgname=${_name}-stripped
pkgver=2.10.34
pkgrel=1
pkgdesc='GNU Image Manipulation Program (stripped from most unnecessary dependencies)'
url='https://www.gimp.org/'
arch=('x86_64')
license=('GPL' 'LGPL')
conflicts=("${_name}")
provides=("${_name}")
depends=('gtk2' 'babl' 'gegl' 'glib-networking' 'mypaint-brushes1' 'poppler-glib' 'poppler-data' 'libgexiv2')
makedepends=('intltool' 'iso-codes')
options=('!emptydirs' '!docs')

_snapshot="${_name}-${pkgver}"
source=("https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_snapshot}.tar.bz2")
sha256sums=('84004642d351b398a4293cd7fd3592044a944f05bb52850ee6068f247c657aa3')

build() {
    cd "${_snapshot}"

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
    cd "${_snapshot}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/share/man"
    ln -s "gimptool-2.0" "${pkgdir}/usr/bin/gimptool"
}
