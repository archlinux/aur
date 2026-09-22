# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=webstonehq
_gitname=seaquel
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, open-source database client for desktop and web"

pkgver=2026.9.2
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
depends=('glibc' 'libgcc' 'libstdc++' 'dbus' 'glib2' 'gtk3' 'zlib' 'cairo' 'libsoup3' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.deb")
sha256sums=('500086e6ec297b21a999f6c8bf22bfa714cd3a8d6449b7a300aff7193bb643f0'
            'ee532cbc55110ff7bea4384756e145b0f0a185447e0ed7e523029a4744b5e98f')
sha256sums_x86_64=('e2aa560274cdeca25fd443f2cd5e6bf3d1c814413ce93a95a2ea1e2dc5fd133e')
sha256sums_aarch64=('55b0665f35e528ad9e5103f9eb7a70f73ecec0d23dedf7c974b001bd5efe6f80')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	sed -i -e 's/Categories=/Categories=Development;/g' -e 's/Comment=.*/Comment=Database client for desktop and web/g' "${pkgdir}/usr/share/applications/${_appname^}.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
