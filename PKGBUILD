# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.2.2
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
	libtgvoip
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
sha512sums=('88f99d9a9815adbe3d5ef95ac15a2c3ed8b31a785bc4cf50d8883a3f1b3b974443f0ec2ff6bb31677b43114467f87586de0c6d31bc4c3cfd52f44e45aa85ab6f')

build() {
	cmake -G Ninja . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DTDESKTOP_API_TEST=ON \
		-DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
		-DDESKTOP_APP_USE_PACKAGED_VARIANT=OFF

	cmake --build .
}

package() {
	DESTDIR="$pkgdir" cmake --install .
}
