# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=billig-sweeper
pkgver=1.2.1
pkgrel=1
pkgdesc="A cheap Minesweeper clone"
arch=('x86_64' 'aarch64')
url="https://github.com/riscygeek/billig-sweeper"
license=('GPL3')
depends=('sdl2' 'sdl2_image')
makedepends=('meson' 'ninja')
source=("https://github.com/riscygeek/billig-sweeper/archive/refs/tags/v${pkgver}.tar.gz" "git+https://github.com/cktan/tomlc99")
sha256sums=(a9d4d06396026caa192ee5cdd505ca3771e4b0c0ff1c5b5d68e18fca1cee1ea0 SKIP)

prepare() {
	rmdir "billig-sweeper-${pkgver}/tomlc99"
	ln -sf "${srcdir}/tomlc99" "billig-sweeper-${pkgver}/tomlc99"
}

build() {
	cd "billig-sweeper-${pkgver}"

	rm -rf _build
	meson setup _build --prefix=/usr
	meson compile -C _build
}

package() {
	cd "billig-sweeper-${pkgver}"
	meson install -C _build --destdir="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
