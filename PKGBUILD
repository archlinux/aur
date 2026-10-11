# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=stffnb
_gitname=edentext
_appname=EdenText
pkgname=${_appname,,}-bin
pkgdesc="Powerful local Word Processor for docx and odt"

pkgver=0.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'gtk3' 'glib2' 'mesa' 'nss' 'systemd-libs' 'dbus' 'alsa-lib' 'pango' 'cairo' 'nspr' 'expat' 'at-spi2-core' 'libx11' 'libxfixes' 'libxext' 'libxdamage' 'libxrandr' 'libxcomposite' 'libxcb' 'libxkbcommon' 'libcups' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname,,}_${pkgver}_${_barch[0]}.deb")
sha256sums=('c89421ef642c1ebaf0db8d4eb39569cb8e88b1fd4c7cbc9fea6815acac0bb7cd'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('d50710ccb8e77558aa091fadae67c2e6589d78bc8ae3dc1db4c7f431092d15ca')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"
	install -dm755 "${pkgdir}/usr/bin/"
	ln -sf "/opt/${_appname}/${_appname,,}" "${pkgdir}/usr/bin/${_appname,,}"
	mv "${pkgdir}/usr/share/doc/${_appname,,}/" "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
