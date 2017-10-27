# Maintainer: Kelie Bailey <then3rd1@gmail.com>
pkgname=openalpr-git
pkgver=master
pkgrel=1
pkgdesc="Automatic License Plate Recognition library, current git master"
arch=('i686' 'x86_64')
url="https://github.com/openalpr/openalpr/archive/master.tar.gz"
license=('GPL3')
depends=('beanstalkd' 'tesseract' 'leptonica' 'opencv-git' 'curl' 'log4cplus')
makedepends=('cmake')
provides=('openalpr')
source=("https://github.com/openalpr/openalpr/archive/$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
	mv "openalpr-master" "$pkgname-$pkgver"
}

build() {

	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr -D CMAKE_INSTALL_SYSCONFDIR:PATH=/etc -D WITH_GPU_DETECTOR=OFF ../src/
	make
}

package() {
	cd "$pkgname-$pkgver"/build/
	make DESTDIR="$pkgdir/" install
}
