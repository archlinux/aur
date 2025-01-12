# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Maintainer:  Robert Falkenberg <robert.falkenberg (at) tu-dortmund.de>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Robert Falkenberg <robert.falkenberg (at) tu-dortmund.de>
# Contributor: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer (at) gmail.com>
# Contributor: Jens Rudolf <jens.rudolf (at) gmx.net>

pkgname=librm
pkgver=2.2.3
pkgrel=1
pkgdesc="Router Manager library"
arch=('x86_64')
url="https://gitlab.com/tabos/librm"
license=('LGPL-2.1-only')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp-1.2 gssdp-1.2 gstreamer gst-plugins-base libsecret libcapi)
makedepends=(meson ninja ccache)

options=('!emptydirs')
source=("https://gitlab.com/tabos/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('db7232be83d9a6d98e8d995950c0fdb21557b2e93218823ab9afa39c475a443dd18d5741b9e681cdbe0de8f5cd323419f5ce1ed42c2e8d23752f5574684fd85f')

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

