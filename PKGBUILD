# Maintainer: SoftExpert <softexpert at gmail dot com>
pkgname=lightning-image-viewer-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Fast and lightweight desktop image viewer'
arch=(x86_64)
url='https://github.com/shatsky/lightning-image-viewer/'
license=(GPL-3.0-only)
depends=(
	# As reported by namcap
	glibc
	libexif
	hicolor-icon-theme
	sdl3
	sdl3_image
)
provides=(lightning-image-viewer)
conflicts=(
	lightning-image-viewer
)
options=(
#	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source_x86_64=(
	"${pkgname}-${pkgver}.deb::https://github.com/shatsky/lightning-image-viewer/releases/download/v${pkgver}/lightning-image-viewer_${pkgver}_amd64.deb"
	"${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/shatsky/lightning-image-viewer/refs/heads/main/LICENSE"
)
b2sums_x86_64=('ba842ecbf815e46f3623ea0960732c3428287411015632ad7134c8e7a3774c9aa0e49cc052b8fad992b69ac0127ec7860aceee08447dc0e70d74ae3b20146cfe'
               '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

prepare() {
	bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}/"
}

package() {
	cp -a \
		"${srcdir}/usr/" \
		"${pkgdir}/usr/"
	install -Dm644 \
		"${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
