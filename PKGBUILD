# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=wickedengine
_pkgname=WickedEngine
pkgver=0.71.787
pkgrel=1
pkgdesc="3D engine with modern graphics "
arch=('any')
url="https://wickedengine.net/"
license=('MIT')
depends=("sdl2")
makedepends=("cmake" "sdl2" "gcc")
source=("https://github.com/turanszkij/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ee2f405c11383ecdd396eeb9c728a7432d621ed15cbee7349374beb000531b4')

prepare(){
	sed -i "/-Wmaybe-uninitialized/d" $srcdir/${_pkgname}-${pkgver}/WickedEngine/CMakeLists.txt
	sed -i "/-Werror/d" $srcdir/${_pkgname}-${pkgver}/WickedEngine/CMakeLists.txt
}

build(){
	cmake -S $srcdir/${_pkgname}-${pkgver} -B $srcdir/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build $srcdir/build
}

package() {
	DESTDIR=${pkgdir} cmake --install ${srcdir}/build
	install -Dm644 $srcdir/${_pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE.md
}
