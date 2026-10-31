# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=buntec
_gitname=btmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A browser-based terminal manager with tmux-inspired UI"

pkgver=0.0.177
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
sha256sums=('306f6d96d422d73af969d1b60d9a2f49689333b733a6fc76138cddaf625c3432'
            '13acc1e5d2175d24bfb52f83464975d0bdb62201782d17ddbc715cff920c5310'
            '80186fecd6dd2e12f3e7357fd005d4ae4a3af8bffbc4a189dc91d141887d96e5'
            '71f96803cc2e656ccd3f85e53197017b51a103adc5ef4f1edf368a97f99b753a'
            '6767451d6f8834c148d0403d2a55fde5d5b70984059d28fe1c614ec8f08a3250')
sha256sums_x86_64=('86b286ff0d4c747a10ed02ab3cbe980be61403e75cd3422bc98a34bf0531d7f6')
sha256sums_aarch64=('be9c6d9503fc4a3acce12f16e7b555e75e3f32ffb2a60fe96c655d0bb93e04ea')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "AUTOMATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTOMATION.md"
	install -Dm644 "INSTALLATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/INSTALLATION.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
