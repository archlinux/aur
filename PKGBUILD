# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

_name=rogerrouter
pkgname=roger-router
pkgver=2.4.0
pkgrel=1
pkgdesc="Journal, Fax-Software and Call-Monitor for AVM FRITZ!Box or compatible"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')
depends=(gtk3 libsoup ghostscript librm poppler-glib cmake libhandy)
makedepends=(meson ninja)
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
sha512sums=('879f7cd3919a015981ecca2649913dd04feec3d86df07ae0551ea4714b12c43406b078e3f9749bdc94225b02ce51bec5dfa604e87f4b160d6704d4a350041774')

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
