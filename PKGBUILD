# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

pkgname=librm
pkgver=2.1.4
pkgrel=1
pkgdesc="Router Manager library"
arch=('x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp gssdp gstreamer gst-plugins-base libsecret libcapi)
makedepends=(meson ninja)

options=('!emptydirs')
source=("https://gitlab.com/tabos/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('5115e9d499a86218895a77c38f13a32bd60af5e4ad8dd65af0789626462acb49bd8468430ff350511ae3c1b81628d6005d9cb1a19926be9cbbd479313d3afcf7')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    meson --prefix /usr --buildtype=plain "builddir"
    ninja -v -C "builddir"
}

check() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    ninja -C "builddir" test
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    DESTDIR="$pkgdir" ninja -C "builddir" install
}

