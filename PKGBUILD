# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=laktak
_pkgname=chkbit
pkgname=${_pkgname}-bin
pkgver=6.4.1
pkgrel=1
pkgdesc="Check your files for data corruption "
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
            'dcfe42f849f137cca59b4f943cf75c498de949551762d3c55be5be59bf81865c')
sha256sums_x86_64=('9ca88a62f9e9ed4503eac10267b00eff1d54abdc0b2cba8c065d495c230bce1e')
sha256sums_arm64=('8c080c7699c2007dd738dfaf8b445939b797c6909cca6eb60c377cfead461df2')
sha256sums_riscv64=('0f98cd437209574ea8c6842a26a5fc3e6d287d118a5177fe4cb69e20c0fbb321')

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
