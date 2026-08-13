# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=DankDown10256
pkgname=procsnap
pkgver=1.0.2
pkgrel=1
pkgdesc="A lightweight Linux process profiler written in C"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-2.0')

provides=("${pkgname}")

makedepends=('make' 'gcc')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('006fa6a78d7968f916a62d4675848f4e2d8a2dcb1b5f3a335d4d332e104653f3')


prepare() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	sed -e '1i PREFIX?=/usr/local\n' -e 's|/usr/local/|${PREFIX}/|g' -e 's|install -m.755|install -Dm755|g' -i "Makefile"
}
build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	make ${pkgname}
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	DESTDIR="${pkgdir}" make install PREFIX="${pkgdir}/usr"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
