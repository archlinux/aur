# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

pkgname=librm
pkgver=2.2.2
pkgrel=1
pkgdesc="Router Manager library"
arch=('x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp gssdp gstreamer gst-plugins-base libsecret libcapi)
makedepends=(meson ninja)

options=('!emptydirs')
source=("https://gitlab.com/tabos/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0ebc448769fc067d06ca5edc50a4050d251c797163be772feafa9b7284973e06d8287d64ed83828623d57234d222866c8fc73467f2835820154ecad543771c5f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson --prefix /usr --buildtype=plain "builddir"
    ninja -v -C "builddir"
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ninja -C "builddir" test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja -C "builddir" install
}

