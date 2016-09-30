# Maintainer: Radu Pirea <pirea.radu@gmail.com>
pkgname=openalpr
pkgver=2.3.0
pkgrel=1
pkgdesc="Automatic License Plate Recognition library."
arch=('i686' 'x86_64')
url="https://github.com/openalpr/openalpr/archive/v2.3.0.tar.gz"
license=('GPL3')
depends=('beanstalkd' 'tesseract' 'leptonica' 'opencv' 'curl' 'log4cplus')
makedepends=('cmake')
provides=('openalpr')
source=("https://github.com/openalpr/openalpr/archive/v$pkgver.tar.gz")
md5sums=('7b864fd6378fb1c847f17953bf3e6ac0')

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

