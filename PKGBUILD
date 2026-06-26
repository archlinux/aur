# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=voleeo
_gitname=voleeo-api
_appname=${_gitname//-api/}
pkgname=${_appname}-bin
pkgdesc="Local-first desktop API client built for developers and AI agents"

pkgver=0.11.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'zlib' 'libsoup3' 'cairo' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'fontconfig' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname^}_${pkgver}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname^}_${pkgver}_${_barch[1]}.deb")
sha256sums=('a019d554dd7a316a1277cb79c5f4d16d00b949ec577d1660e485f37486084757'
            '54afa993b1c990afd7d7d24b0297398beb6b0d422b5624139e3dff59626da804')
sha256sums_x86_64=('3fe6adf0fe00017c0351edb7dcb3b29b643a43996e6b404a7967d4cafe70f1b2')
sha256sums_aarch64=('9780da147080da34182e97cbcb92d057dc967f75baf492f1b8e4aeed183b6c2d')


package() {
	cd "${pkgdir}/" || exit

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	sed -e "s|Categories=\.*|Categories=Development;Utility;|g" -i "${pkgdir}/usr/share/applications/${_appname^}.desktop"
}
