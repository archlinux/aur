# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
pkgname=koku-xinput-wine
pkgver=1.2.1
pkgrel=1
_srcname="${pkgname}-${pkgver}"
pkgdesc="Adds xinput support to Wine without modifying the source binaries of Wine."
arch=('i686' 'x86_64')
url="https://www.github.com/KoKuToru/koku-xinput-wine"
license=('custom:BSD2')
conflicts=("${pkgname}-git")

makedepends=('cmake' 'wine')
makedepends_x86_64=('gcc-multilib')
depends_x86_64=('lib32-sdl2')
depends_i686=('sdl2')

source=("${pkgname}::${url}/archive/v${pkgver}.tar.gz")
md5sums=('c38ec13596471bdc46b1bea12b60a525')

build() {
	cd "${srcdir}/${_srcname}"
  cmake .
  make
} 

package() {
	cd "${srcdir}/${_srcname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/BSD2"
	if [ "$CARCH" == "x86_64" ]; then
		install -Dm755 koku-xinput-wine.so koku-xinput-wine64.so -t "${pkgdir}/usr/lib32/"
	else
		install -Dm755 koku-xinput-wine.so -t "${pkgdir}/usr/lib/"
	fi
}

