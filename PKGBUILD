# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ayoub Eddaoudi <me@ayoubedd.me>

_pkgauthor=laktak
_pkgname=zfind
pkgname=${_pkgname}-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="Search for files (even inside tar/zip/7z/rar) using a SQL-WHERE filter"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'arm64' 'riscv64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
makedepends=('help2man')
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
		"README_${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_arm64=("${_pkgname}_${pkgver}_arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
source_riscv64=("${_pkgname}_${pkgver}_riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-riscv64.tar.gz")
sha256sums=('f7ebb783a3ebbfd8d9871f0e1b69729c153e66c0d61a715ce58675021cffa748'
            '3b2bb02267ae086d6f1e74d9f5ed81015a5c19cb149ea3f0ee779bb465ef7d70')
sha256sums_x86_64=('fb016f67fda4be03ca781f4092aa8274fd72b6dbbe3491562b77cb6ecac53757')
sha256sums_arm64=('57092153d61aa02a2da169eafc8002e9e3f212d25d0b2bed4e92e81d76e37184')
sha256sums_riscv64=('0d4a7135f07a3837095649a5e821016811b785f7245949ecc99323fd15609d9e')

build() {
	cd "${srcdir}/" || exit

	help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
