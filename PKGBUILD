# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=AKolenda
_gitname=openxplorer
_appname=OpenXplorer
pkgname=${_gitname}-bin
pkgdesc="Windows File Explorer-inspired file manager for Linux"

pkgver=2.0.1
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
sha256sums=('3192dfe460c9535d5b47c26cc50052ae67c52d1ce4d1ce3b1b9df2682947e136'
            'd8801b51a2b1f41264673b03d1d8ff2593f269e33972105894567959cdc45c9b'
            'fa330b7ec7715da6050bb6cd8cc5ec86c61d0671da711fcc79460cf69193d260')


package() {
	cd "${pkgdir}"

	tar -xf ${srcdir}/data.tar.xz
	install -dm755 ${pkgdir}/usr/share/doc/${pkgname}/
	mv ${pkgdir}/usr/share/doc/${_gitname}/*.md ${pkgdir}/usr/share/doc/${pkgname}/ && rm -rf ${pkgdir}/usr/share/doc/${_gitname}/

	install -Dm644 ${srcdir}/README-${pkgver}.md ${pkgdir}/usr/share/doc/${pkgname}/README.md

	install -Dm644 ${srcdir}/LICENSE-${pkgver} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
