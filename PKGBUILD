# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=vmargb
_gitname=parts-of-speech
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Record voice-overs with a studio-like review workflow"

pkgver=0.4.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'alsa-lib')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LAUNCHER.desktop" "ICON.png")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('a62f03c66556759fb4d126eb9c5fd30b279f57f34d9ef1de725f503bd98474c0'
            'f67dd6a822120135c1d517531cc03947ee8b96f212dcda8067bd8664e3a2e1ce'
            '4762cf1d2e0985a18fcda771f54d3965c4814a851be22a674d2b649804ce0179')
sha256sums_x86_64=('95e09e55f93e316ef7fd8258ef688ae15268efc6b9880dff58a8be71511792ab')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LAUNCHER.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
	install -Dm644 "ICON.png" "${pkgdir}/usr/share/icons/${_appname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
