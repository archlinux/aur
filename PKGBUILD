# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=kurtbuilds
_pkgname=dye
pkgname=${_pkgname}-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="CLI tool to easily color text in your shell"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('0fba33e712b47fff4ac42c8ffe9862a045b62b496c3843b781cda79d1714aa51'
            'f3da2e0307b0742a8d3949bd282cd73c80cf6eace75d4b19efe221f92472ce9d')
sha256sums_x86_64=('a10bd11271150b3621baf3deacf901669b9abe5ce0b579b0cf2f9f4c83f36c2c')
sha256sums_aarch64=('1b890d235986811ccf71ed802d0095cb67119ea31a022229722f6beab41a9b81')


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
