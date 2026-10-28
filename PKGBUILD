# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=FortoGraphy
_gitname=prism-download-manager
_appname=Prism
pkgname=${_gitname}-bin
pkgdesc="The fast, beautiful, open-source download manager for Windows, macOS and Linux — Up to 32 connections, browser integration, video & MP3 downloads, crash-safe resume"

pkgver=1.1.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="https://prismdl.site/"

license=('MIT')

conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'cairo' 'dbus' 'openssl' 'libsoup3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'hicolor-icon-theme')

options=('!strip')

source=("BROWSER-EXTENSION-${pkgver}.md::${_ghurlraw}/docs/guide/browser-extension.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname,,}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('c5f34aaaf1ecf1a3970f955fb56effac4deebe0c17664f17a8fd4ccb1b7d829d'
            'a4af410be58ceb1be2842b93f083dcd30f5e4868a16f606b1efc6fbc383c07d8'
            '25a36f52335b77308ed7ed587d1b70e074e1757d997686ef6eb936952c5da956')
sha256sums_x86_64=('f17c9f964d776b478f3e4ee61c9bb6ca4d9f24283d37baeb7bd713a5d8bf66f2')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "${srcdir}/BROWSER-EXTENSION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/BROWSER-EXTENSION.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
