# Maintainer: SoftExpert <softexpert at gmail dot com>
# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
pkgname=yaak-beta-bin
_betaver=5
pkgver=2025.2.0
pkgrel=0.${_betaver}
pkgdesc='Offline and Git friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC (Pre-compiled version)'
arch=(x86_64)
url='https://yaak.app/'
license=(MIT)
depends=(
	# As reported by namcap
	cairo
	gcc-libs
	gdk-pixbuf2
	glib2
	glibc
	gtk3
	hicolor-icon-theme
	libsoup3
	pango
	webkit2gtk-4.1
)
provides=(yaak yaak-app)
conflicts=(
	yaak
	yaak-bin
	yaak-bin-beta
	yaak-appimage
	yaak-git
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source_x86_64=(
	"${pkgname}-${pkgver}-beta.${_betaver}.deb::https://github.com/mountain-loop/yaak/releases/download/v${pkgver}-beta.${_betaver}/yaak_${pkgver}-beta.${_betaver}_amd64.deb"
	"${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/mountain-loop/yaak/refs/tags/v${pkgver}-beta.${_betaver}/LICENSE"
)
b2sums_x86_64=('79b6a1c4c4a0690c436bd3c1db54fbf2ed4e5a105f68c54a15c2f0f1b150758bfcb31bb26889d3fac46d564436363b4159f173d6929b7c6978eed2ebae3025e9'
               '011fb406bfe4a8944efbae1f9cfa420fe421f1de3ae628802548676a1fe1318850a5f98c60cd29899efe3946dec329b6607f04917e966808f62f9e4ecaaea13b')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
}

build() {
	sed -e 's|Name=yaak|Name=Yaak-beta|' \
		-e '$aGenericName=API Client' \
		-i "${srcdir}/usr/share/applications/yaak.desktop"
}

package() {
	cp -a \
		"${srcdir}/usr/" \
		"${pkgdir}/usr/"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
