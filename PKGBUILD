# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=termilly
_gitname=termilly
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal that keeps your agents, servers and projects in view"

pkgver=1.10.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'gtk3' 'bash' 'libnotify' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('042548aca1498c7d4dcb267e1f531e3c43aa98861a3867098b578cde95f0590f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('82ede213186ba454e40319c077e6b528cfba97cb3a7f45709c38ffaa49568580')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.zst"

	rm -rf "${pkgdir}/usr/share/doc/${_appname}"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
