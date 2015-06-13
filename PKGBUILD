# Maintainer: Your Name <youremail@domain.com>
pkgname=minisign-git
pkgver=51b5499
pkgrel=1
pkgdesc='A dead simple tool to sign files and verify signatures.'
arch=('any')
url='https://jedisct1.github.io/minisign/'
license=('MIT')
depends=('libsodium')
makedepends=('cmake')
provides=('minisign')
source=('git://github.com/jedisct1/minisign')
sha256sums=('SKIP') #autofill using updpkgsums

pkgver() {
	cd minisign
	git rev-parse --short HEAD
}

build() {
  cd minisign

  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd minisign/build
  make DESTDIR="$pkgdir/" install
}
