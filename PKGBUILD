# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=waukeerules
_gitname=SuperXTerminal
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A terminal and session manager for teams who look after a lot of servers and network devices together."

pkgver=0.8.1
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
sha256sums=('e338ee7de919ea08a89025dfa9ade9ec7d3bd12aee1a47c9b11d5f4ce4a27576'
            '01a7f589f25b2f1a3421e9aaf9c239e4a72fd04b0157ad62099c0bc85b330d25')
sha256sums_x86_64=('017cec883cb20603c866ebd882a58fe9d67d898a2f2637b5185208736bbf6c49')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mv "${pkgdir}/usr/lib/${_gitname}/THIRD-PARTY-NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
