# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-image-formats
pkgver=6.31.0
pkgrel=1
pkgdesc='Image format plugins for Qt 6'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-image-formats'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libgcc'
	'libstdc++'
	'qt6-base'
)
makedepends=(
	'jxrlib'
	'libavif'
	'libheif'
	'libjxl'
	'libraw'
	'openexr'
	'openjpeg2'
	'sonic-frameworks-archive'
	'sonic-frameworks-cmake-modules'
)
optdepends=(
	'imath: EXR format support'
	'jxrlib: JXR format support'
	'libavif: AVIF format support'
	'libheif: HEIF format support'
	'libjxl: JPEG-XL format support'
	'libraw: RAW format support'
	'openexr: EXR format support'
	'openjpeg2: JPEG 2000 format support'
	'sonic-frameworks-archive: plugin for Krita and OpenRaster images'
)
provides=('kimageformats')
conflicts=('kimageformats')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('01645074425dec983aa0e28673e5ed88845f5487b918adfa7a1b207831f9ed14')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF \
		-DKIMAGEFORMATS_HEIF=ON \
		-DKIMAGEFORMATS_WITH_KNOWN_CRASHES_JXR=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
