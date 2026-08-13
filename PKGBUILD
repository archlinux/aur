# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=noahbclarkson
_gitname=rgitui
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A GPU-accelerated desktop Git client built in Rust with GPUI"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'zlib' 'openssl' 'hicolor-icon-theme')

options=(!strip)

source=("ICON-16-${pkgver}.png::${_ghurlraw}/assets/icons/app-icon-16.png"
		"ICON-32-${pkgver}.png::${_ghurlraw}/assets/icons/app-icon-32.png"
		"ICON-48-${pkgver}.png::${_ghurlraw}/assets/icons/app-icon-48.png"
		"ICON-256-${pkgver}.png::${_ghurlraw}/assets/icons/app-icon-256.png"
		"ICON-512-${pkgver}.png::${_ghurlraw}/assets/icons/app-icon-512.png"
		"APPLICATION-${pkgver}.desktop::${_ghurlraw}/crates/${_appname}/resources/linux/${_appname}.desktop"
		"METAINFO-${pkgver}.xml::${_ghurlraw}/crates/${_appname}/resources/linux/com.${_appname}.app.metainfo.xml")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('25fd44f8c7bea68b876c37322e42bb898587d585394af069359cf419d3c5eb04'
            'd4cadcb19207ec3168211655e7b9e61a23f09791429f781ab094d3612ebdbee8'
            '954641a99499db3be1d0127b3aa1d6121af4fdd356be55ee6565e115b3b0fe16'
            'f3c9ab74c5d4e4eb8c6d664d4beb971030b3cd2ae6495655b922539e4c5f03d2'
            '84c8d8c1ffa2114a14d9fa1be70b1b16897416e7d86d4d2801850fb49fe871c9'
            '1d7798802d4b382ba42cada0dd1324b6c86ad1a3c2cf2b3e01b12428f4a3669f'
            '9a52a1c5efd55e9c7d7b6d09e81d72101b44f7a490367c7771c0c22059e28248')
sha256sums_x86_64=('d91f45611336809b8b4dc4aee9faa603711c94df3f77956eb0bfff0c6b15d9fe')


package() {
	cd "${srcdir}/" || exit

	install -Dm644 "ICON-16-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_appname}.png"
	install -Dm644 "ICON-32-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_appname}.png"
	install -Dm644 "ICON-48-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_appname}.png"
	install -Dm644 "ICON-256-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png"
	install -Dm644 "ICON-512-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png"

	install -Dm644 "APPLICATION-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "METAINFO-${pkgver}.xml" "${pkgdir}/usr/share/metainfo/com.${_appname}.app.metainfo.xml"

	install -Dm755 "${_appname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${_appname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
