# Maintainer: Ryan Owens <RyanOwens[at]linux[dot]com>

pkgname=libkovanserial-git
pkgver=r97.d84ef9b
pkgrel=1
pkgdesc="The library behind kovan and computer interaction over serial"
arch=('any')
url="https://github.com/kipr/libkovanserial"
license=('GPL3')
depends=('cmake>=2.8.12')
provides=('libkovanserial')
source=(${pkgname}::"git+https://github.com/kipr/libkovanserial.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd ${srcdir}/${pkgname}
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make 
}

package() {
	cd ${srcdir}/${pkgname}/build
	make DESTDIR="${pkgdir}" install
}
