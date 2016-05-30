# Maintainer: Quentin Glidic <sardemff7@eventd.org>

pkgname=eventd
pkgver=0.18.2ù†žª 
_pkgdir=${pkgname}-${pkgver}
pkgrel=1
pkgdesc="A small daemon to act on remote or local events"
arch=(
    i686
    x86_64
)
url="https://www.eventd.org"
license=(
    GPL3
    LGPL3
    MIT
)
depends=(
    avahi
    'cairo>=1.14.0'
    gdk-pixbuf2
    'glib2>=2.40.0'
    glib-networking
    pango
    libsystemd
    libxcb
    util-linux
    xcb-util
    xcb-util-wm
)
makedepends=(
    libxslt
    docbook-xsl
)
optdepends=(
    'librsvg: SVG images support'
)
options=(
    !strip
)
source=(
    https://www.eventd.org/download/${pkgname}/${pkgname}-${pkgver}.tar.xz
)
sha256sums=(
    917c13ed4b9e311bdca908b71d4c56853dd948be4dda672d6cb30b71c0389c74
)

build() {
    local params=(
        --prefix=/usr
        --enable-systemd
        --disable-introspection
        --disable-ssdp
        --disable-nd-wayland
        --disable-im
        --disable-sound
    )

    cd "${srcdir}"/${_pkgdir}
    ./configure "${params[@]}"

    make
}

check() {
    cd "${srcdir}"/${_pkgdir}
    make check
}

package() {
    cd "${srcdir}"/${_pkgdir}
    make DESTDIR="${pkgdir}" install
}
