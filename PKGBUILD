# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgname=gostman
pkgname=${_pkgname}-bin
pkgver=1.7.2
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
#	"LICENSE::https://raw.githubusercontent.com/kunalgoesbyken/gostman/v${pkgver}/LICENSE"
)
b2sums_x86_64=('f1c2815a7eb8ac48cd87a4e930cb6c2ae9794521999cfb8d29d591ee627dcd19b639077126663bb971abf2c6d6aded662d63ab61d63b2af907e39aa569410993')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

package() {
	cp -r "${srcdir}/usr" "${pkgdir}/"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	#install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
