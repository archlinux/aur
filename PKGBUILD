# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bencherdev
_pkgname=bencher
_execname=${_pkgname}

pkgname=${_pkgname}-cli-bin
pkgver=0.6.10
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
            '852dba92a4c9d3813e92405f670d56ba7d389c668373eef5e222ec7e11f72b87'
            '5cb75a9d3cb35e114a77844515b4a4760afbdff486a03593bdb7eb243a4d12d4')
sha256sums_x86_64=('85f0ecf4607270c71d3e69ec03921f0da61cd243dbe191e9c05ec0143ae9e7cc')
sha256sums_aarch64=('703dde74e7790da1fb7bc087ac555e07b23e39064feeb99bacc85e9237affff8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
