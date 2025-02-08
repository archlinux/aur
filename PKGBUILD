# Maintainer: SoftExpert <softexpert at gmail dot com>
# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
pkgname=yaak-beta-bin
_betaver=14
pkgver=2025.1.0
pkgrel=0.${_betaver}
pkgdesc='Simple and intuitive API client for calling REST, GraphQL, and gRPC APIs (Pre-compiled version)'
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
b2sums_x86_64=('2b47b74e18bdf26b74914c53a25d6d6682b9755ad48bd718606465c0849aa793ef7dd774c2c44b154b974dc853f2774b6f7308969f1732fd8cccb0d1b760bddd'
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
