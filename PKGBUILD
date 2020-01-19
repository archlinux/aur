# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

_name=rogerrouter
pkgname=roger-router
pkgver=2.1.6
pkgrel=1
pkgdesc="Journal, Fax-Software and Call-Monitor for AVM FRITZ!Box or compatible"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')
depends=(gtk3 libsoup ghostscript librm poppler-glib)
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

source=("https://gitlab.com/tabos/${_name}/-/archive/v${pkgver}/${_name}-v${pkgver}.tar.gz")
sha512sums=('fe92aeccd9b5693fa8fdc0b9c572500341bfdf0be0a88a16eb796cf672019e87a361def2f8666ecd5ef38eb656b2956b37c8bc5d6edbe962e14b40dbab876626')

build() {
    cd "${srcdir}/${_name}-v${pkgver}"
    meson --prefix /usr --buildtype=plain "builddir"
    ninja -v -C "builddir"
}

check() {
    cd "${srcdir}/${_name}-v${pkgver}"
    ninja -C "builddir" test
}

package() {
    cd "${srcdir}/${_name}-v${pkgver}"
    DESTDIR="$pkgdir" ninja -C "builddir" install
}
