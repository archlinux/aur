# Maintainer: lantw44 (at) gmail (dot) com

pkgname=qelly-git
_pkgname=Qelly
pkgver=1.0b.18.g1dbb09b
pkgrel=1
pkgdesc="Beautiful cross-platform BBS client"
arch=('x86_64' 'i686')
url="https://github.com/uranusjr/Qelly"
license=('GPL')
depends=('qt4' 'libqxt')
makedepends=()
conflicts=('qelly')
provides=('qelly')
source=("$pkgname::git+https://github.com/uranusjr/Qelly.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local ver="$(git describe --long)"
	ver="${ver#v}"
	ver="${ver//-/.}"
	printf "%s" "$ver"
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin"
	install -m 755 "bin/Qelly" "${pkgdir}/usr/bin"
}
