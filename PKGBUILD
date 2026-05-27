# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sectore
_pkgname=timr-tui
pkgname=${_pkgname//-tui}-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="A TUI to organize your time: Pomodoro, Countdown, Timer"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname//-tui}")
conflicts=("${_pkgname//-tui}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux_${arch[0]}.tar.gz")
sha256sums=('5e7fe81a6c6ac0a3050262e875a98def21bd3ef20eaad1e760f22f7e41af6fb8'
            '55e13afb4d736c1243c86494da1163eedd7deca213f79eb3a3a0438a71dc25d8'
            '6f24f886f15aaaa8b73e02187d71e44d9b9a86cb3699261923068b7bbbbb6991')
sha256sums_x86_64=('0e864bc65d3405cb546b1748a6fac574e588577774094ad15047f605c2c15778')


build() {
	cd "${srcdir}/" || exit

	help2man "./${_pkgname}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname//-tui}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname//-tui}.1.gz"
}
