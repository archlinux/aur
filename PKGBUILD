# Maintainer: lantw44 (at) gmail (dot) com

pkgname=qelly-git
_pkgname=Qelly
pkgver=1.0a2.1.g7c18a56
pkgrel=2
pkgdesc="Qelly is a Qt port of Nally"
arch=('x86_64' 'i686')
url="https://github.com/uranusjr/Qelly"
license=('GPL')
depends=('qt4' 'libqxt')
makedepends=()
conflicts=('qelly')
provides=('qelly')
source=("$pkgname::git+https://github.com/uranusjr/Qelly.git"
        "Fix-QTranslator-Filename.patch")
md5sums=('SKIP'
         '55915bbd7bc13673a9d510bb2e456c10')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local ver="$(git describe --long)"
	ver="${ver#v}"
	ver="${ver//-/.}"
	printf "%s" "$ver"
}

build() {
	cd "${srcdir}/${pkgname}"
	patch -p1 < ../Fix-QTranslator-Filename.patch
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
	install -m 644 "bin/Qelly_zh_tw.qm" "${pkgdir}/usr/lib/${_pkgname}"
	install -m 755 "bin/Qelly" "${pkgdir}/usr/lib/${_pkgname}"
	ln -s "../lib/${_pkgname}/Qelly" "${pkgdir}/usr/bin/Qelly"
}
