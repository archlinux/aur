# Maintainer:  Nigel Kukard <nkukard@lbsd.net>

pkgname=cputool
pkgver=0.0.8
pkgrel=1
pkgdesc='CPUTool is a utility which can be used to control the CPU utilization of almost any process'
arch=('i686' 'x86_64')
url="https://gitlab.devlabs.linuxassist.net/cputool/cputool"
license=('GPL3')
makedepends=('docbook2x')
source=(
	"https://download.allworldit.org/cputool/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
	"https://download.allworldit.org/cputool/v${pkgver}/${pkgname}-${pkgver}.tar.xz.asc"
)
md5sums=(
	'0e42fac9dabab44b4a5b52d980d5a01f'
	'SKIP'
)
validpgpkeys=('CF5D5BE37903E265E87DC78266438A5B0FEC558A')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i "${startdir}/docbookfix.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX=/usr install
}

