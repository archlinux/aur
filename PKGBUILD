# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Dhairya3391
_gitname=kari
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Search, stream, and download anime, movies, TV shows & cartoons across 5+ providers with MPV/IINA/VLC/MX Player support, Trakt/AniList scrobbling, and auto-subtitles"

pkgver=3.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

depends=('mpv')
optdepends=('yt-dlp' 'aria2' 'curl' 'upx')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}")
sha256sums=('88408d5f5e90af1cbd874c79e3af4a25ad072a5eee2a8fe388337fc23dd004bd'
            'cfe49cf99a0612a353aa74cfe9b6dbaa4b545c499ddac88f0319e639a1cfac51')
sha256sums_x86_64=('b31815c41adda8b7c02fa6cc07ad03cd4b806a2e3a73cec4508d5ae01f2f0261')
sha256sums_aarch64=('4086821369842aa9d7f2835ff7774388436ed3c0fbb75846a0daa9004b74e596')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
