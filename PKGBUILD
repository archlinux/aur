# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=stffnb
_gitname=edentext
_appname=EdenText
pkgname=${_appname,,}-bin
pkgdesc="Powerful local Word Processor for docx and odt"

pkgver=0.10.1
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
sha256sums=('75389d98dc01826291889499f5fab48480f005ee04891ae37cbc8212ca738cd5'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('494678ec49c3af6d9dca2939233f45ecc00d4225cf0cc3a5eb623c449732b609')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"
	install -dm755 "${pkgdir}/usr/bin/"
	ln -sf "/opt/${_appname}/${_appname,,}" "${pkgdir}/usr/bin/${_appname,,}"
	mv "${pkgdir}/usr/share/doc/${_appname,,}/" "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
