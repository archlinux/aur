# Maintainer: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2-git
pkgver=20150607
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2 device"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('Apache' 'GPL')
depends=('libusb' 'glu' 'freeglut' 'libcl' 'opencv')
makedepends=('cmake' 'git' 'wget')
provides=('libfreenect2' 'glfw') # TODO Remove glfw
conflicts=('libfreenect2' 'glfw') # TODO Remove glfw
source=('git+https://github.com/OpenKinect/libfreenect2.git')
md5sums=('SKIP')

build() {
	cd "${srcdir}/libfreenect2/depends";
	./install_glfw.sh;
	./install_ubuntu.sh;

	cd "${srcdir}/libfreenect2/examples/protonect";
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CXX11=ON .;
	make;
};

package() {
	cd "${srcdir}/libfreenect2/examples/protonect";
	make DESTDIR="${pkgdir}" install
};
