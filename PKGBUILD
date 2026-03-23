# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sectore
_pkgname=timr-tui
pkgname=${_pkgname//-tui}-bin
pkgver=1.8.0
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
            '575fa522b8e6a3a728e2f3c0ab8f4f62510c8f4129969a689450b025e32404fc'
            '6bd0e600450399a9e4212431ef230e27877ef70780963b0654c7f90130436152')
sha256sums_x86_64=('0d1e8f0fd31e6a6eb96d0cfdcc78f88ab5948009d1cb8daa746cae865c6d412b')


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
