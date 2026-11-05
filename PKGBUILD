# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgname=gostman
pkgname=${_pkgname}-bin
pkgver=1.15.1
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
b2sums_x86_64=('303728e1ea361a6b83cc3a6f0afd5519aa4410023fc687114adf334bcf24fa86e3fdd0b8fb8d48c5a4604344ef7329e023357a1233a7640ad5a27c5ed334dcb7')

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
