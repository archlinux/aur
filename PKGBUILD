# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=wickedengine
_pkgname=WickedEngine
pkgver=0.71.532
pkgrel=1
pkgdesc="3D engine with modern graphics "
arch=('any')
url="https://wickedengine.net/"
license=('MIT')
depends=("sdl2")
makedepends=("cmake" "sdl2" "gcc")
source=("https://github.com/turanszkij/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aebd608c321808ed4735155800bacad02e50b8f0c505e9e13ec352dea678ecc3')

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
