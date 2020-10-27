# Maintainer: sgar <swhaat at github>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jens Rudolf <jens.rudolf@gmx.net>

_name=rogerrouter
pkgname=roger-router
pkgver=2.2.1
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

source=("https://gitlab.com/tabos/${_name}/-/archive/v${pkgver}/${_name}-v${pkgver}.tar.gz")
sha512sums=('dd7163d086c46286ebbf5e4451fbb21792b789d1406955d0bd8672882fde66187337197a761549b1a907a975a6360a963c7f6655373d68e90ab273087b321927')

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
