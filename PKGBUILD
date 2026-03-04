# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=laktak
_pkgname=chkbit
pkgname=${_pkgname}-bin
pkgver=6.6.0
pkgrel=1
pkgdesc="Check your files for data corruption and run quick file deduplication"
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
sha256sums=('2164c7b23ede004282e53a7cda37ce11de5d74dbd807199a411b34420645bd91'
            '7b11d91d917d2df8d95c4d09e73357592ca5ec523b61f27e5b4b47272793bc11')
sha256sums_x86_64=('caba031ddaf4819e1c619849262d0b9bdb2cedb06faee70e40dc9de16195f77c')
sha256sums_arm64=('7ba88a675ef4ec28fce83c71b4ecca1069a8e77f97954bb874ec80e474786852')
sha256sums_riscv64=('8969161dff61196eb31c0b538c1216ccf0b79fd15a4ff0975b76983c312c19a9')

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
