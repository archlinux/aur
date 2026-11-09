# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=waukeerules
_gitname=SuperXTerminal
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A terminal and session manager for teams who look after a lot of servers and network devices together."

pkgver=0.8.2
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
sha256sums=('aead4ef34475381eee8a7e10125f6097f8608a41b4c6949dccf749bbd9a08d6d'
            '01a7f589f25b2f1a3421e9aaf9c239e4a72fd04b0157ad62099c0bc85b330d25')
sha256sums_x86_64=('a5b901d8d12bdbda53a9ccf3ca8fc5611f32f096e6bbf0db7f19813b84aa42bc')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mv "${pkgdir}/usr/lib/${_gitname}/THIRD-PARTY-NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
