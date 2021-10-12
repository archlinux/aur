# Maintainer: Leon Plickat <leonhenrik.plickat@stud.uni-goettingen.de>

pkgname=lavalauncher
pkgver=2.1.1
pkgrel=1
pkgdesc='A simple launcher panel for Wayland'
arch=(x86_64)
url='https://git.sr.ht/~leon_plickat/lavalauncher'
license=(GPL3)
depends=('cairo' 'wayland' 'wayland-protocols' 'libxkbcommon')
makedepends=('gcc' 'meson' 'ninja' 'scdoc')
optdepends=("librsvg: SVG image support.")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('951edb0e00a118cd57d54349349d4898cfc18c6208a7c4d7f6e892eec1497c3b')

pkgver() {
	printf "2.1.1"
}

build()
{
	cd "${srcdir}/${pkgname}-v${pkgver}"
	meson build --prefix /usr
	ninja -C build
}

package()
{
	cd "${srcdir}/${pkgname}-v${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
