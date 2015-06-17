# Maintainer: M0Rf30
# Contributor: Carlos RH Ruiz <ruizh.cj@gmail.com>

pkgname=pam-face-authentication
pkgver=0.3
pkgrel=7
pkgdesc="PAM face auth"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pam-face-authentication"
license=('GPL')
depends=('pam' 'opencv' 'libx11' 'qt4')
makedepends=('cmake')
source=('http://pam-face-authentication.googlecode.com/files/pam-face-authentication-0.3.tar.gz')

build() {
cd "$srcdir"/${pkgname}-$pkgver

	rm cmake/modules/FindOpenCV.cmake
	cp /usr/share/opencv/OpenCVConfig.cmake cmake/modules
	sed -i 's/OPENCV_LIBRARIES/OpenCV_LIBS/g' CMakeLists.txt
	cmake -D CMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 .
}

package() {
cd ${srcdir}/${pkgname}-$pkgver
make || return 1
make DESTDIR="$pkgdir/" install || return 1
}

md5sums=('5ef71bcf4bdebd2ee7216387ef17fc27')
