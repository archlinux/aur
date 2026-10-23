# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=stffnb
_gitname=edentext
_appname=EdenText
pkgname=${_appname,,}-bin
pkgdesc="Powerful local Word Processor for docx and odt"

pkgver=0.12.0
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
sha256sums=('e36d3ba4540656a2016c3034f61d6657a755978d4dae092e09c264f4866ba9ee'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('d15244e01bc75f5cdf55878f795e2718bf4a718eb955ce38b21d10c139681783')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"
	install -dm755 "${pkgdir}/usr/bin/"
	ln -sf "/opt/${_appname}/${_appname,,}" "${pkgdir}/usr/bin/${_appname,,}"
	mv "${pkgdir}/usr/share/doc/${_appname,,}/" "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
