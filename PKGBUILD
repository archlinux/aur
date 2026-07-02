# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=voleeo
_gitname=voleeo-api
_appname=${_gitname//-api/}
pkgname=${_appname}-bin
pkgdesc="Local-first desktop API client built for developers and AI agents"

pkgver=0.13.0
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
sha256sums=('2cb313349e1189cc0cfb9c781cfbf208ca2da2e4d2215feae34234f7863eb4ef'
            '54afa993b1c990afd7d7d24b0297398beb6b0d422b5624139e3dff59626da804')
sha256sums_x86_64=('d44f2cb4914c93a22428f00ec6c1108175e14a0ae5a45957e25a22071424b9f1')
sha256sums_aarch64=('915d2ee7331ea9392617de7c9d13fe82efdebd3e46e461685ad4fb0f044cfad4')


package() {
	cd "${pkgdir}/" || exit

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	sed -e "s|Categories=\.*|Categories=Development;Utility;|g" -i "${pkgdir}/usr/share/applications/${_appname^}.desktop"
}
