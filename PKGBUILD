# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=buntec
_gitname=btmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A browser-based terminal manager with tmux-inspired UI"

pkgver=0.0.127
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
sha256sums=('46f3ff4d7f7e55c4501094dc331895f424205cec3d01abd9550dcd3f194fbbba'
            '8863d74dc9be102d3eecab6dcbf83934bd7a25d11a5b014d099185e8a21594e6'
            '35c56703864b5f941e5460e66fb27f54bfbff924806dcf856dafdccdd4dc67d5'
            '78e3dd1c89e1c5a8eb7da987933d46b52b3623a6947d78c6d6168ba870e8e3b9'
            '6767451d6f8834c148d0403d2a55fde5d5b70984059d28fe1c614ec8f08a3250')
sha256sums_x86_64=('7489fa52c07242b1ede1eb871d0d3f68b26855e884ba3fbc8ea1e50a41190639')
sha256sums_aarch64=('e84866ff9808c0e09f4d6bf98cbb6dc6063e18ae92d7baa94ed5251734d8392b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "AUTOMATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTOMATION.md"
	install -Dm644 "INSTALLATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/INSTALLATION.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
