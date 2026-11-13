# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danielravina
_gitname=stemkit
_appname=StemKit
pkgname=${_gitname}-bin
pkgdesc="Split any YouTube song into stems"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

conflicts=("${pkgname%-bin}")

depends=('glibc' 'glib2' 'libgcc' 'bash' 'python' 'python-numpy' 'python-pytorch' 'python-beartype' 'python-packaging' 'nss' 'expat' 'mesa' 'alsa-lib' 'dbus' 'cairo' 'gtk3' 'at-spi2-core' 'pango' 'nspr' 'libdrm' 'systemd-libs' 'libxdamage' 'libcups' 'libxcb' 'libxrandr' 'libxcomposite' 'libxkbcommon' 'libx11' 'libxfixes' 'libxext' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.deb")
sha256sums=('486bdd3a8f8fcc05cdc5bc0a5f85866c4d50a0f944a8ea53afee139586a1a4fe'
            'acd462c0d190620860abbd07aa158091d2b8db7083b9fb193c4e243faf9a05de')
sha256sums_x86_64=('9b3b98086ea5917153d3fb8f4d4e38409e21a7d6e671a892bb18deae4b161a54')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"
	rm -rf "${pkgdir}/usr/share/doc"
	mv "${pkgdir}/usr/share/icons/hicolor/2048x2048" "${pkgdir}/usr/share/icons/hicolor/512x512"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
