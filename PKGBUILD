# Maintainer: Dmitry Lavnikevich <haff@midgard.by>

pkgname=extopts
pkgver=2.0.4
pkgrel=3
pkgdesc="Extended command line arguments parsing library"
arch=('i686' 'x86_64')
url="https://github.com/githaff/extopts"
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('staticlibs')
source=("git+https://github.com/githaff/extopts.git#tag=v${pkgver}")
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
