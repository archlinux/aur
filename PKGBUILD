# Maintainer: Dmitry Lavnikevich <haff@midgard.by>

pkgname=diembox
pkgver=2.0.0
pkgrel=1
pkgdesc="DiEM toolbox"
arch=('i686' 'x86_64')
url="https://github.com/githaff/diembox"
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'extopts')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/githaff/diembox.git#tag=v${pkgver}")
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
