# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bencherdev
_pkgname=bencher
_execname=${_pkgname}

pkgname=${_pkgname}-cli-bin
pkgver=0.6.15
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="Detect and prevent performance regressions before they make it to production with continuous benchmarking"

arch=('x86_64' 'aarch64')
_barch=('linux-x86-64' 'linux-arm-64')

_ghurl="https://github.com/${_pkgauthor}/${_pkgname}"
_ghurlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgver}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_execname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("SECURITY-${pkgver}.md::${_ghurlraw}/SECURITY.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE.md")
source_x86_64=("${_execname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_pkgver}/${_pkgname}-${_pkgver}-${_barch[0]}")
source_aarch64=("${_execname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_pkgver}/${_pkgname}-${_pkgver}-${_barch[1]}")
sha256sums=('1efae98c80428e7aa00686872ca31101828a6d73e1f7f057b69fc94bbbfeb2a9'
            '69527c6b73d21b3c6e814816b5b2e88fce13b7fa0579b80101d10cad4d3fb75d'
            '5cb75a9d3cb35e114a77844515b4a4760afbdff486a03593bdb7eb243a4d12d4')
sha256sums_x86_64=('16ac76f938f86421b66fd5082ae022719af8fe7741fe674868d335201023287a')
sha256sums_aarch64=('e97981634aa5101a44478ab4c1c6f3a30b0a49b935fdefa5ee39a611be02cdc1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
