# Maintainer: Leon Plickat <leonhenrik.plickat@stud.uni-goettingen.de>

pkgname=lavalauncher
pkgver=2.1.0
pkgrel=2
pkgdesc='A simple launcher panel for Wayland'
arch=(x86_64)
url='https://git.sr.ht/~leon_plickat/lavalauncher'
license=(GPL3)
depends=('cairo' 'wayland' 'wayland-protocols')
makedepends=('gcc' 'meson' 'ninja' 'scdoc')
optdepends=("librsvg: SVG image support.")
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4d51d857ddfc682cf7dbc4dcd60a776b6816610230afead4608fdd7693261274')

pkgver() {
	printf "2.1.0"
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
