# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=profex
pkgver=3.10.2
pkgrel=1
pkgdesc="Open source XRD and Rietveld refinement."
arch=('i686' 'x86_64')
url="http://profex.doebelin.org"
license=('GPL2')
groups=('science')
depends=('bgmn'
	'qt5-declarative'
	'qt5-svg')
depends_i686=('gcc-libs')
depends_x86_64=('gcc-libs-multilib')
provides=('profex')
conflicts=('profex')
source=("$url/wp-content/uploads/2016/10/${pkgname}-${pkgver}.tar.gz"
	"local://profex.desktop")
md5sums=('b5308154260ef9f6f811f9d072a8d28a'
         'd67ab02738497d00e200af6ee572d92b')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	qmake PREFIX=${pkgdir}/usr profex.pro
	make -j 4
}

package() {
	cd ${srcdir}
	install -Dm644 "${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	cd "$pkgname-$pkgver"
	install -Dm644 "src/icons/${pkgname}.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	make install

	install -Dm755 "src/profex" "${pkgdir}/usr/bin/profex"
}
