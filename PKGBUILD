# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Dhairya3391
_gitname=kari
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Search, stream, and download anime, movies, TV shows & cartoons across 5+ providers with MPV/IINA/VLC/MX Player support, Trakt/AniList scrobbling, and auto-subtitles"

pkgver=8.3.0
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
sha256sums=('8e53537eed512eae97efa4513117fa8ea5cc81dda408329031f9d635994f2939'
            'cfe49cf99a0612a353aa74cfe9b6dbaa4b545c499ddac88f0319e639a1cfac51')
sha256sums_x86_64=('7ac5be9644a4db89fc22e394dbe88f1ce93c2d48b58d59daa6877c2f1a10fee1')
sha256sums_aarch64=('5be759c9bcb3164cb7fa6306edb7e083f937d8d6de6d721f7d6ec9147f9e6f09')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
