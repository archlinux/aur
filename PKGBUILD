# Maintainer: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=runt
pkgname=runt-git
pkgver=r137.587b5fa
pkgrel=1
pkgdesc="Stack-based language written in ANSI C"
arch=(any)
url="http://paulbatchelor.github.io/proj/runt/"
license=('custom:public domain')
depends=(glibc)
makedepends=(git sporth-git)
provides=(runt)
conflicts=(runt)
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	find "${_pkgname}" -type f -exec sed -i "s|/usr/local|${pkgdir}/usr|g" {} \;
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/include" "${pkgdir}/usr/lib"
	cd "${_pkgname}"
	make install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
