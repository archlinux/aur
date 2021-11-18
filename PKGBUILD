# Maintainer: Nova King <technobaboo@protonmail.com>

pkgname=stereokit-git
_pkgname=StereoKit
pkgver=r1824.26f40519
pkgrel=1

pkgdesc="An easy-to-use open source library for building XR apps with C#/C++ and OpenXR!"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://stereokit.net/"
license=('MIT')

provides=('stereokit')
depends=('openxr>=1.0.18' 'fontconfig' 'glew')
makedepends=('git' 'cmake')

source=(git+https://github.com/maluoi/StereoKit.git#branch=develop)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "StereoKit" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	install -Dm775 "StereoKit/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
