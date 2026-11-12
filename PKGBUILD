# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=waukeerules
_gitname=SuperXTerminal
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A terminal and session manager for teams who look after a lot of servers and network devices together."

pkgver=0.8.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('Linux-x64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'cairo' 'libsoup3' 'gdk-pixbuf2' 'webkit2gtk-4.1' 'alsa-lib' 'zlib' 'openssl' 'hicolor-icon-theme')

options=('!emptydirs' '!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${pkgver}-${_barch[0]}.deb")
sha256sums=('27ce36bf0cbe63795554e3f93df3bff9c87a5cb90bd9f03668eb6bd75ace9d74'
            '01a7f589f25b2f1a3421e9aaf9c239e4a72fd04b0157ad62099c0bc85b330d25')
sha256sums_x86_64=('c87bf8a279c97640500c57960fbb54e6293cb6b97b125b4f223f7f84cce4a80a')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mv "${pkgdir}/usr/lib/${_gitname}/THIRD-PARTY-NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
