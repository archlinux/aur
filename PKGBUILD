# Maintainer: Ryan Owens <RyanOwens[at]linux[dot]com>

pkgname=libkar-git
pkgver=r37.0777a50
pkgrel=1
pkgdesc="an extremely simple Qt based keyed archiver for usage by the KISS IDE suite of applications"
arch=('any')
url="https://github.com/kipr/libkar"
license=('GPL3')
depends=('cmake>=2.8.12' 'qt5-base')
provides=('libkar')
source=(${pkgname}::"git+https://github.com/kipr/libkar.git")
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
