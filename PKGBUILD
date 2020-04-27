# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.3.1
pkgrel=1
pkgdesc="Kotatogram – experimental Telegram Desktop fork"
arch=(x86_64)
url="https://kotatogram.github.io"
license=(GPL3)
depends=(
	qt5-base
	qt5-imageformats
	ffmpeg
	openal
	xz
	lz4
	xxhash
	zlib
	minizip
	openssl
	libdbusmenu-qt5
	hunspell
	hicolor-icon-theme
)
makedepends=(
	git
	python
	cmake
	ninja
	microsoft-gsl
	tl-expected
	range-v3
)
optdepends=(
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin')
source=("https://github.com/kotatogram/${pkgname}/releases/download/k${pkgver}/${pkgname}-${pkgver}-full.tar.gz")
sha512sums=('f06faaa81b7485f94c15fa70dd9f034a5608c0a2d984cb2c0678fb2f359d542e24bedd4e01d0a93163a557dd32ad452013ad33ca5fa247957311022db430d67c')

build() {
	cd ${pkgname}-${pkgver}-full

	cmake -B build -G Ninja . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DTDESKTOP_API_TEST=ON \
		-DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
		-DDESKTOP_APP_USE_PACKAGED_VARIANT=OFF \
		-DTDESKTOP_USE_PACKAGED_TGVOIP=OFF

	cmake --build build
}

package() {
	cd ${pkgname}-${pkgver}-full
	DESTDIR="$pkgdir" cmake --install build
}
