# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=voleeo
_gitname=voleeo-api
_appname=${_gitname//-api/}
pkgname=${_appname}-bin
pkgdesc="Local-first desktop API client built for developers and AI agents"

pkgver=0.18.0
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
sha256sums=('50edcfeb6620b5a1bd11f4e6c2ce2ba0b336ec39e2c87e6143bd319ba69897e4'
            '54afa993b1c990afd7d7d24b0297398beb6b0d422b5624139e3dff59626da804')
sha256sums_x86_64=('695ac9e07d76d5913121b065efa3beae2db3f6b90d9c457d612ceff7ac646870')
sha256sums_aarch64=('63afa12d404209afcf05767f739a0536e1d1935ef146a4b7df5f2ab508c82f63')


package() {
	cd "${pkgdir}/" || exit

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	sed -e "s|Categories=\.*|Categories=Development;Utility;|g" -i "${pkgdir}/usr/share/applications/${_appname^}.desktop"
}
