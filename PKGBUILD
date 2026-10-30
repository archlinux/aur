# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AKolenda
_gitname=openxplorer
_appname=OpenXplorer
pkgname=${_gitname}-bin
pkgdesc="Windows File Explorer-inspired file manager for Linux"

pkgver=2.0.10
pkgrel=1
_gitversion=v${pkgver}

arch=('any')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0-only')

provides=('openxplorer' 'winspace')
conflicts=("${provides[@]}")

depends=('bash' 'python' 'python-gobject' 'gtk3' 'glib2' 'libsecret' 'webkit2gtk-4.1' 'hicolor-icon-theme')

options=('!strip')

source=("${_appname}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_all.deb"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
sha256sums=('d8be251322c80b5ff4d7c2f68872624e66464d5c1cb2145c8f28e95fc8ff6ebf'
            '50a3787cf97d07b39b1952fae6855b4ee3d0f669058bf88f67d9b6b03d258451'
            'fa330b7ec7715da6050bb6cd8cc5ec86c61d0671da711fcc79460cf69193d260')


package() {
	cd "${pkgdir}"

	tar -xf ${srcdir}/data.tar.xz
	install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/
	mv ${pkgdir}/usr/share/doc/${_gitname}/*.md ${pkgdir}/usr/share/doc/${pkgname}/ && rm -rf ${pkgdir}/usr/share/doc/${_gitname}/

	install -Dm644 ${srcdir}/README-${pkgver}.md ${pkgdir}/usr/share/doc/${pkgname}/README.md

	install -Dm644 ${srcdir}/LICENSE-${pkgver} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
