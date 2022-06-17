# Maintainer: Mirko Scholz <srtlg>
pkgname=libobjcryst
pkgver=2021.1.2
pkgrel=1
pkgdesc='ObjCryst++ repackaged for installation as a system shared library.'
arch=('i686' 'x86_64')
url='http://fox.vincefn.net/FoxWiki'
depends=()
makedepends=('scons' 'boost')
license=('GPL2')
source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/diffpy/libobjcryst/archive/v${pkgver}.tar.gz")
sha256sums=('7f4d2c7e42154bbc780032ce7efe303b57a14d566b9b52fad8c6754a53b1365d')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -e "s/^if env..PLATFORM.. == .posix. and WhereIs..ldconfig..:/if False:/" -i src/SConscript
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	scons ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 -d "${pkgdir}/usr"
	scons install "prefix=${pkgdir}/usr"
}
