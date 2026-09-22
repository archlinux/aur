# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=DankDown10256
pkgname=procsnap
pkgver=1.0.8
pkgrel=1
pkgdesc="A lightweight Linux process profiler written in C"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-2.0')

provides=("${pkgname}")

makedepends=('make' 'gcc')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ee146321756d9d4b6d0caa468f32e73fae35827b1ab3255905ea503ab97aab3d')


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
