# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=buntec
_gitname=btmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A browser-based terminal manager with tmux-inspired UI"

pkgver=0.0.181
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
sha256sums=('5109256ed74774712bf81471d9fb74e14f5247d940b3594447d63d225fc1b398'
            '13acc1e5d2175d24bfb52f83464975d0bdb62201782d17ddbc715cff920c5310'
            '778b2798e13ffd333608cb2064ca20d44bbb074793a0c918f80b5d93ecafccee'
            '71f96803cc2e656ccd3f85e53197017b51a103adc5ef4f1edf368a97f99b753a'
            '6767451d6f8834c148d0403d2a55fde5d5b70984059d28fe1c614ec8f08a3250')
sha256sums_x86_64=('345d6e5053a7f4301cb5e07f266ce2cd2692feba67847637ddb6a31fe6f8db7f')
sha256sums_aarch64=('647d8d1bb22a1f43c00374c279da4729ba16f5750dc5c0bca0a6f7a8750fef3e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "AUTOMATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTOMATION.md"
	install -Dm644 "INSTALLATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/INSTALLATION.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
