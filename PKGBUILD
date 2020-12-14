# Maintainer: Leon Plickat <leonhenrik.plickat@stud.uni-goettingen.de>

pkgname=lavalauncher
pkgver=2.0.0
pkgrel=3
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
sha256sums=('6aa9d6fe189f658dabb709c1902454ebaa7dace8259d39c2256397657a411f9b')

pkgver() {
	printf "2.0.0"
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
