# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Dhairya3391
_gitname=kari
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Search, stream, and download anime, movies, TV shows & cartoons across 5+ providers with MPV/IINA/VLC/MX Player support, Trakt/AniList scrobbling, and auto-subtitles"

pkgver=2.2.0
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
sha256sums=('81971ac6f139d14d6f2f2781421d1a9ac998f7dae32913d1b5d89c75f6de29eb'
            'cfe49cf99a0612a353aa74cfe9b6dbaa4b545c499ddac88f0319e639a1cfac51')
sha256sums_x86_64=('3ff7bdb3537f7181d12a16226e627c4129f0e0b2984dcb05e6145002720a9ea2')
sha256sums_aarch64=('fff1784252e44d87097ce77f63177a854a4d37b84124096ec677da368a12f628')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
