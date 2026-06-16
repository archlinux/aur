# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sectore
_pkgname=timr-tui
pkgname=${_pkgname//-tui}-bin
pkgver=1.10.0
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
            'ad4d7fce3f966c06a8f62ecc06297a8af0c3e271bcea87ce5db07348b20e46a2'
            'd16d0d3bed3317e2ca381e77ddeef94b5c808604de90204446b54fd6b5067847')
sha256sums_x86_64=('6385e9ba0f24506312631ded2a248471273a3c2e7e1416bc9d44dcc330117115')


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
