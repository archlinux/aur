# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=billig-sweeper
pkgver=1.3
pkgrel=1
pkgdesc="A cheap Minesweeper clone"
arch=('x86_64' 'aarch64')
url="https://github.com/riscygeek/billig-sweeper"
license=('GPL3')
depends=('sdl2' 'sdl2_image')
makedepends=('git' 'meson' 'ninja')
source=("https://github.com/riscygeek/billig-sweeper/archive/refs/tags/v${pkgver}.tar.gz" "git+https://github.com/cktan/tomlc99")
sha256sums=(94b6ac8d2ae4a5745728aed0bb0702bb624e9f6072f4252f84f334dadb8cdf57 SKIP)

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
