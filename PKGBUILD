# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

_name=rogerrouter
pkgname=roger-router
pkgver=2.1.0
pkgrel=2
pkgdesc="Journal, Fax-Software and Call-Monitor for AVM FRITZ!Box or compatible"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(gtk3 libsoup ghostscript librm poppler-glib libgdata libappindicator-gtk3 evolution-data-server)
makedepends=(intltool gobject-introspection meson git)
optdepends=(
	'cups: FAX printer'
	# 'evolution-data-server: Address book integration'
	# 'libpulse: Pulse Audio support'
	'portaudio: PortAudio support'
	# 'libnotify: Desktop notifications'
	# 'libappindicator-gtk3: App indicator support'
)

conflicts=("${_name}" "roger")
provides=("${_name}=${pkgver}" "roger=${pkgver}")
options=('!emptydirs')
# install=roger-router.install
source=("git+https://gitlab.com/tabos/${_name}.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	meson --prefix /usr --buildtype=plain "builddir"
  ninja -v -C "builddir"
}

check() {
	cd "${srcdir}/${_name}"
	ninja -C "builddir" test
}

package() {
	cd "${srcdir}/${_name}"
	DESTDIR="$pkgdir" ninja -C "builddir" install
}
