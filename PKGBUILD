# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ThioJoe
pkgname=jpeg2png
pkgver=1.02
pkgrel=1
pkgdesc="Silky smooth JPEG decoder"
arch=('x86_64' 'i686')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-3.0')

provides=("${pkgname}")
conflicts=("${pkgname}-git")
makedepends=('gcc' 'make' 'libjpeg-turbo' 'libpng' 'help2man')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b2467e44db60e6d11f347f356be6b29a8bf0597ca97ad5afae9d461e8dcf119')


build() {
	cd ${pkgname}-${pkgver} || exit 1

	make -j

	help2man "./${pkgname}" --output "${pkgname}.1" --no-info
	gzip "${pkgname}.1"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
