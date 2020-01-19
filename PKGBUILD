# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

pkgname=librm
pkgver=2.1.1
pkgrel=1
pkgdesc="Router Manager library"
arch=('x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp gssdp gstreamer gst-plugins-base libsecret libcapi)
makedepends=(meson ninja)

options=('!emptydirs')
source=("https://gitlab.com/tabos/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('b9a75d8b2850e0ee72f4d83eaff845e0afc878549322f60d7c9e1e7acfa77fb3dd2c0b21aebf9ff1976dfa1a0b7b07671cbb1b432b18f7f2c2dad605817a50ad')

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

