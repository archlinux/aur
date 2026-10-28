# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bencherdev
_pkgname=bencher
_execname=${_pkgname}

pkgname=${_pkgname}-cli-bin
pkgver=0.6.14
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
            '6cec290efa82e7401a27ff4a45f35cb9399ab60dd3bf83c76858858cbc4d1875'
            '5cb75a9d3cb35e114a77844515b4a4760afbdff486a03593bdb7eb243a4d12d4')
sha256sums_x86_64=('966cf07ef5bdb33a919c27027380853523b8340e458488cab7bfb780baf3d1c9')
sha256sums_aarch64=('612a20c2413838d0f8fff2b93eb5de5bc286e5c16fdb84365953d1d6257612ee')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
