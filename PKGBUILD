# Maintainer: Evert Vorster (evorster@gmail.com)
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
pkgname=movit-git
pkgver=r915.0b17055
pkgrel=1
pkgdesc="The modern video toolkit"
arch=(x86_64)
url="http://movit.sesse.net/"
license=('GPL')
depends=('fftw' 'libepoxy')
provides=('movit')
conflicts=('movit')
makedepends=('gtest' 'eigen' 'libpng' 'sdl2_image')
optdepends=('libpng12: demo application', 'sdl_image: demo application')
source=('git+http://git.sesse.net/movit')
sha1sums=('SKIP')
#options=(debug !strip)

pkgver() {
  cd movit
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd movit
	./autogen.sh
    sed -ie 's/libpng12/libpng/g' configure
	./configure --prefix=/usr
	make GTEST_DIR=/usr/src/googletest
}

package() {
	cd movit
	make DESTDIR="${pkgdir}" install 
}
