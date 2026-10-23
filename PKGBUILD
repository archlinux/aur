# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgname=gostman
pkgname=${_pkgname}-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='An API client for REST, GraphQL, gRPC and WebSocket that you, your CI pipeline and your coding agent share. Desktop app, web app and command line, no account.'
arch=(x86_64)
url='https://github.com/kunalgoesbyken/gostman'
license=(MIT)
depends=(
	# As reported by namcap
	glib2
	glibc
	gdk-pixbuf2
	gtk3
	libsoup3
	webkit2gtk-4.1
)
provides=(gostman)
conflicts=(
	gostman
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package
)
source_x86_64=(
	"${_pkgname}-${pkgver}.deb::https://github.com/kunalgoesbyken/${_pkgname}/releases/download/v${pkgver}/Gostman-linux-amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/kunalgoesbyken/gostman/v${pkgver}/LICENSE"
)
b2sums_x86_64=('922cdc64689661231d7599abd66f1972e215d6388cbbaa76777a1cbe09806e7b80c5068007796f294e2ae089fc691751a22dcd577f5ced0b2175b604b05cc5a2'
               'd84ae1988407afa1ab306a57c9c5bd11e3fe296d4595f97cb9b18329e41fa441a3e4105a0ae422a7d3929da16fd09cf9fd1d744d6a6da13e71445b851786155c')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
	cp -r "${srcdir}/usr" "${pkgdir}/"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
