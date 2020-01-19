# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

pkgname=librm
pkgver=2.1.2
pkgrel=1
pkgdesc="Router Manager library"
arch=('x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp gssdp gstreamer gst-plugins-base libsecret libcapi)
makedepends=(meson ninja)

options=('!emptydirs')
source=("https://gitlab.com/tabos/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('1afb9cb529207c1a29a8c45f91809d008949bf8d4e6ecbe139c72ffde5c4109ac46846ffa2fb3190ee6949f1233f4675a51d568b0fd0dac791915f6c7b22d621')

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

