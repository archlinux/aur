# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: M0Rf30
# Contributor: Carlos RH Ruiz <ruizh.cj@gmail.com>

pkgname=pam-face-authentication
pkgver=0.3
pkgrel=9
pkgdesc="PAM face auth"
arch=('any')
url="http://code.google.com/p/pam-face-authentication"
license=('GPL')
depends=('pam' 'opencv2' 'libx11' 'qt4')
makedepends=('cmake')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pam-face-authentication/pam-face-authentication-${pkgver}.tar.gz")
sha512sums=('a140aa6c2662c83e656727c92db61d9f8df6061e222b0934bb0bf73b6472e14b124027e2b3da1a3f5d7fa8b4d3d7d9b198bb3132f5a79f8ad0847f567ff0c79d')

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
	mv $pkgdir/lib $pkgdir/usr
}
