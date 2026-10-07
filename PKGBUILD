# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=buntec
_gitname=btmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A browser-based terminal manager with tmux-inspired UI"

pkgver=0.0.120
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'zlib')

options=('!strip')

source=("CONFIGURATION-${pkgver}.md::${_ghurlraw}/docs/configuration.md"
		"INSTALLATION-${pkgver}.md::${_ghurlraw}/docs/installation.md"
		"AUTOMATION-${pkgver}.md::${_ghurlraw}/docs/automation.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('cbf460f09394815e5bd019a5a144fc37e972f102221cdbfeb4baa953438c13cd'
            '6ea6ef761686d514fa93b17085bb2d55564c5b357259fd388b7a22f3015b13c0'
            '35c56703864b5f941e5460e66fb27f54bfbff924806dcf856dafdccdd4dc67d5'
            '86316051b5143e62715f73df66d0feaf5a718ceb6c0e125c81a07b615968fd61'
            '6767451d6f8834c148d0403d2a55fde5d5b70984059d28fe1c614ec8f08a3250')
sha256sums_x86_64=('7a7397210850a36c20ec9490234e5840199e6d45324ffbfba4f912a974b97e4e')
sha256sums_aarch64=('9a7aa928b58a828f4e37807b7f04e2cbfb2482bb98433d6f38abc3919d87c7bd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "AUTOMATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTOMATION.md"
	install -Dm644 "INSTALLATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/INSTALLATION.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
