# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libvtflib-git
pkgver=r44.eaca22d
pkgrel=4
pkgdesc="Library to handle Valve's Texture Format"
arch=('x86_64')
url="https://github.com/panzi/VTFLib"
license=('LGPL-2.1-or-later')
depends=('libtxc_dxtn')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'ninja')
source=("git+https://github.com/panzi/VTFLib.git")
md5sums=('SKIP')


pkgver() {
cd $srcdir/VTFLib
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"

	cmake -S VTFLib -B build \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-GNinja

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
