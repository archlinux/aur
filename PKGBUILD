# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=gianndev
pkgname=mussel
pkgver=0.2.0
pkgrel=2
pkgdesc="The Mussel Programming Language"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')

depends=('gcc-libs' 'glibc')
provides=("${pkgname}")
makedepends=('make' 'rust')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac7741fb5e03432714cfe89945049677ee488f897eb54aac15d7eb2d8feed1a8')

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	make release
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"

	install -Dm644 "doc/Standard_Library.md" "${pkgdir}/usr/share/doc/${pkgname}/STANDARD_LIBRARY.md"
	install -Dm644 "doc/Tutorial.md" "${pkgdir}/usr/share/doc/${pkgname}/TUTORIAL.md"

	mkdir -p "${pkgdir}/usr/share/${pkgname}/examples"
	cp -a "examples/"* "${pkgdir}/usr/share/${pkgname}/examples/"
}
