# Maintainer: Ayoub Eddaoudi <me@ayoubedd.me>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=laktak
_pkgname=zfind
pkgname=${_pkgname}-bin
pkgver=0.4.6
pkgrel=3
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
            'c2131f6b289465447c365067a472faae36a9929a0355bda0398961b28d01318e')
sha256sums_x86_64=('312940b532de1660e3fa35bcd47a61ce6e2fb95cc78b1028f4d104f90da6b3de')
sha256sums_arm64=('47c3e54a33dd760e9e19a30b19b1b11a0dcb5649b09ab59fc3f6756884a7ccc6')
sha256sums_riscv64=('eaf20f081eda78cc788279462dce25a7ef0aa55e0e9fb7eba841584d73ad3021')

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
