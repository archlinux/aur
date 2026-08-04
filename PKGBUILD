# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Dhairya3391
_gitname=kari
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Search, stream, and download anime, movies, TV shows & cartoons across 5+ providers with MPV/IINA/VLC/MX Player support, Trakt/AniList scrobbling, and auto-subtitles"

pkgver=2.5.1
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
sha256sums=('54bbcacb76e079ddf9c92664da7c8c3ce5f3c6f3de0ee563bf5c446cfa3f0dd6'
            'cfe49cf99a0612a353aa74cfe9b6dbaa4b545c499ddac88f0319e639a1cfac51')
sha256sums_x86_64=('1ad5621573a5f232638f6f9f0b39fe2dd48ee563fb51bd045313f77e11735981')
sha256sums_aarch64=('d25665c5a70915849a91ad2b40fbc109a399370246b12ba4e71d812ca67dd865')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
