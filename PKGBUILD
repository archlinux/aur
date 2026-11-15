# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Mark44928
_gitname=Plusalator
pkgname=${_gitname,,}
pkgver=1.2.0
pkgrel=1
_gitversion=v${pkgver}
pkgdesc="Fancy interactive C++17 calculator REPL"

license=('MIT')
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"

provides=("${pkgname}")

makedepends=('make' 'clang' 'figlet')
depends=('glibc' 'libgcc' 'libstdc++')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${_gitname}/archive/${_gitversion}.tar.gz")
sha256sums=('b1f11090a92fe4358141bf5d700aa8ae9bf01d9bc75a5257504851facfe883a1')


prepare() {
	cd ${srcdir}/${pkgname^}-${pkgver} || exit 1

	make banner
}

build() {
	cd ${srcdir}/${pkgname^}-${pkgver} || exit 1

	make
}

check() {
	cd ${srcdir}/${pkgname^}-${pkgver} || exit 1

	make check
}

package() {
	cd ${srcdir}/${pkgname^}-${pkgver} || exit 1

	DESTDIR="${pkgdir}" make install PREFIX="${pkgdir}/usr"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
