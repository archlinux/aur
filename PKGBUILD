# Maintainer: Daniel Kirchner <daniel@ekpyron.org>
pkgname=stereogl
pkgver=0.2
pkgrel=1
pkgdesc="StereoGL provides a uniform interface for stereo 3D displays under OpenGL."
url="http://stereogl.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('freeglut')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://downloads.sourceforge.net/stereogl/stereogl/stereogl-${pkgver}/stereogl-${pkgver}.tgz" "stereogl-0.2-fixes-1.patch")
md5sums=('1289e80b004bef4ce57fefc35162c6a5'
         'c9c46caf4ef95540a4184f6ad0ad80f5')

build() {
	cd "$pkgname-$pkgver"
	make -C alpha clean
	make -C src clean
	make -C utils clean
	patch -Np1 -i ../stereogl-0.2-fixes-1.patch
	cd src
	make
}

package() {
	cd "$pkgname-$pkgver"/src
	make DESTDIR="$pkgdir/" install
}
