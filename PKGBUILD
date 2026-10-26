# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-file-metadata
pkgver=6.31.0
pkgrel=1
pkgdesc='A library for extracting file metadata'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-file-metadata'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'ebook-tools'
	'exiv2'
	'ffmpeg'
	'glibc'
	'libgcc'
	'libstdc++'
	'poppler-qt6'
	'qt6-base'
	'sonic-frameworks-archive'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-settings'
	'sonic-frameworks-text-codec'
	'taglib'
)
optdepends=(
	'catdoc: Extract text from Office 98 files'
	'kdegraphics-mobipocket: MOBI extractor'
	'libappimage: AppImage extractor'
)
makedepends=(
	'catdoc'
	'doxygen'
	'kdegraphics-mobipocket'
	'libappimage'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kfilemetadata')
conflicts=('kfilemetadata')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cab416de326aa64c0ff77f7198fc361db5337ec545732b79b9924ea9a9421b8e')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
