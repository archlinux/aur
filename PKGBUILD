# Maintainer: Nova King <technobaboo@protonmail.com>

pkgname=stereokit-egl
_pkgname=StereoKit
pkgver=0.3.4
pkgrel=1

pkgdesc="An easy-to-use open source library for building XR apps with C#/C++ and OpenXR!"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://stereokit.net/"
license=('MIT')

provides=('stereokit')
depends=('openxr>=1.0.18' 'fontconfig' 'libegl' 'libgl')
makedepends=('git' 'cmake')

source=($pkgname-$pkgver.tar.gz::https://github.com/maluoi/StereoKit/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('SKIP')

build() {
	cmake -B build -S "StereoKit-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DSK_BUILD_SHARED_LIBS=ON \
		-DSK_BUILD_TESTS=OFF \
		-DSK_LINUX_EGL=ON \
		-Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	install -Dm775 "StereoKit-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
