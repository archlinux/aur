# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AlexsJones
_gitname=llama-panel
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A llama-server command centre"

pkgver=0.11.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'gtk3' 'glib2' 'openssl' 'libsoup3' 'cairo' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.deb")
sha256sums=('59c541b3ad0101da431d512bbba0711e72960b07a65ec35a00bb566cad1c852c'
            'b52696dc0457bf58616f5017e5146b2932611b9357bb9824c7c91183fc36471f')
sha256sums_x86_64=('a7995a478127600173888069bfd56f0c951ed607714ea6a2416d6fd41b51e695')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"

	sed -i -e 's/Categories=/Categories=Development;/g' "${pkgdir}/usr/share/applications/llama-panel.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
