# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

_name=rogerrouter
pkgname=roger-router
pkgver=2.4.2
pkgrel=4
pkgdesc="Journal, Fax-Software and Call-Monitor for AVM FRITZ!Box or compatible"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')
depends=(gtk3 libsoup ghostscript librm poppler-glib libhandy)
makedepends=(meson ninja cmake)
optdepends=(
	'cups: FAX printer'
	'evolution-data-server: Evolution address book support'
	'libappindicator-gtk3: App indicator support'
	'libgdata: Google address book support'
)

conflicts=("${_name}" "roger")
provides=("${_name}=${pkgver}" "roger=${pkgver}")
options=('!emptydirs')
install=roger-router.install

source=("https://gitlab.com/tabos/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('5fe17dc7edf1830a968f9cbd7844b2a552b9fc8b7755b7d23143c9d03adc7b29dcfb2d98c62c08a3095b1f59c212a0895b3f50ef60a4be788b523fb3aeebc0a2')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    meson --prefix /usr --buildtype=plain "builddir"
    ninja -v -C "builddir"
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    ninja -C "builddir" test
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    DESTDIR="$pkgdir" ninja -C "builddir" install
}
