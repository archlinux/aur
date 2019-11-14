# Maintainer: DaarkWel <daarkwel at mail dot ru>
pkgname=fb2edit
pkgver=0.1.0
pkgrel=1
pkgdesc="FB2 ebooks editor"
arch=('i686' 'x86_64')
url="https://github.com/vitlav/fb2edit"
license=('GPL3')
depends=('qt5-webkit' 'libxml2' 'qt5-xmlpatterns' 'qt5-imageformats' 'qt5-translations')
makedepends=('cmake>=3.1.0')
source=(http://fb2edit.lintest.ru/pub/$pkgname-$pkgver.tar.bz2)
install=${pkgname}.install

_gitname=fb2edit
_gitroot=https://github.com/vitlav/${_gitname}

source=("${pkgname}-${pkgver}.tar.gz::${_gitroot}/archive/${pkgver}.tar.gz" "${pkgname}.install")
sha256sums=('8395fd3e786b0d60f7d18f744e6176464441d8e4ac56f86361b06e5e2214c8a6' 'bf4edf1f92991d177fa2ea434c806de51d3ca0cb2f6e385e36b76960786b2ff3')

#pkgver() {
#	cd "${srcdir}/${_gitname}"
#	git describe --long --tags | sed 's/^v//;s/-/./g'
#}

build() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build
	cd "build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
