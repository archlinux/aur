# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=actionswf
pkgver=1.132
pkgrel=2
pkgdesc="Action Swf library"
arch=('x86_64')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('lib32-glibc' 'bc' 'ffdec-bin')
makedepends=('lib32-glibc' 'bc' 'ocompiler>=1.5+226' 'ffdec-bin')
source=("${pkgname}-`echo ${pkgver} | sed 's/\./\-/'`.tar.gz::https://github.com/colin-i/${pkgname}/archive/`echo ${pkgver} | sed 's/\./\-/'`.tar.gz")
sha256sums=('0fdeaece56bb99b8383d9b5ecfe703648778232cbe3308b503fcf545af03f021')

ver_atsource_fn() {
	cd "${pkgname}-`echo ${pkgver} | sed 's/\./\-/'`"
}

prepare() {
	patches="`cat ../list`"
	ver_atsource_fn
	for var in ${patches[@]}; do
		echo ${var}
		patch --strip=1 --input=../../${var}
	done
}

build() {
	ver_atsource_fn
	make
}

check() {
	ver_atsource_fn
	make test
}

package() {
	ver_atsource_fn
	make DESTDIR="$pkgdir/" install
}
