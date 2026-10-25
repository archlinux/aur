# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgname=gostman
pkgname=${_pkgname}-bin
pkgver=1.8.0
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
	!debug     # 
)
source_x86_64=(
	"${_pkgname}-${pkgver}.deb::https://github.com/kunalgoesbyken/${_pkgname}/releases/download/v${pkgver}/Gostman-linux-amd64.deb"
)
b2sums_x86_64=('e9a6ffb37732b396fa85345827fd957adf96f12316aa1c8580e5f24fc9d67043151669c54656d25950c7d9fac6edeef99612432a122e9dc892569b9073ea2f5b')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
	cp -r "${srcdir}/usr" "${pkgdir}/"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
