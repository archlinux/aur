# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=kurtbuilds
_pkgname=modenv
pkgname=${_pkgname}-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="CLI to easily manage .env files and keep them consistent"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('0fba33e712b47fff4ac42c8ffe9862a045b62b496c3843b781cda79d1714aa51'
            '7b28ae776caeec6ebfcb8345603a79dd321d43813db2c3b8159b70d7f083ae62')
sha256sums_x86_64=('1ea73688ce14deae89492460956324df6a73abf25520b31a688cdd4aa131e618')
sha256sums_aarch64=('1ea73688ce14deae89492460956324df6a73abf25520b31a688cdd4aa131e618')


build() {
	cd "${srcdir}/" || exit

	help2man "./${_pkgname}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
