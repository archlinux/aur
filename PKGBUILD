# Maintainer: Dmitry Lavnikevich <haff@midgard.by>

pkgname=embox
pkgver=1.2.0
pkgrel=1
pkgdesc="Embedded developmer's toolbox"
arch=('i686' 'x86_64')
url="https://github.com/githaff/embox"
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'extopts')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/githaff/embox.git#tag=v${pkgver}")
md5sums=('SKIP')


build() {
	mkdir -p "${srcdir}/${pkgname}"
	cd "${srcdir}/${pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release "../${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
