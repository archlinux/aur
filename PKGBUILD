# Maintainer: Mikkel ALMONTE--RINGAUD <contact@vexcited.com>
pkgname=fiak-bin
# renovate: datasource=github-releases depName=Vexcited/Fiak
pkgver=2026.3.1_fiak0
ver=${pkgver//_/-}
pkgrel=1
pkgdesc="Fast, offline and Git-friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC based on Yaak (Pre-compiled version)"
arch=(x86_64)
url="https://github.com/Vexcited/Fiak"
license=(MIT)
depends=(
	cairo
	dbus
	fontconfig
	gcc-libs
	gdk-pixbuf2
	glib2
	glibc
	gtk3
	hicolor-icon-theme
	libsoup3
	webkit2gtk-4.1
	zlib
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package
)
source_x86_64=(
	"${pkgname}-${pkgver}.deb::https://github.com/Vexcited/Fiak/releases/download/v${ver}/fiak_${ver}_amd64.deb"
	"${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/Vexcited/Fiak/refs/tags/v${ver}/LICENSE"
)
sha256sums_x86_64=('a689ff141ce0b7694660d32a31b5b7b16f2a7a4e5517e181719bc1e2321276cc'
                   'b9954c6ea318dddb547e98dd8f5a8c0aad7117cf0ca12e7b31e55bd4d207164f')
prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

build() {
	sed -e 's|Name=fiak|Name=Fiak|' \
		-e '$aGenericName=API Client' \
		-i "${srcdir}/usr/share/applications/fiak.desktop"
}

package() {
	cp -a \
		"${srcdir}/usr/" \
		"${pkgdir}/usr/"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
