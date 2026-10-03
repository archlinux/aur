# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danielravina
_gitname=stemkit
_appname=StemKit
pkgname=${_gitname}-bin
pkgdesc="Split any YouTube song into stems"

pkgver=0.1.24
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
sha256sums=('4825bbac5240e22129e769e6a83c146830d593cec4a2e04e386ac8694105cc92'
            'acd462c0d190620860abbd07aa158091d2b8db7083b9fb193c4e243faf9a05de')
sha256sums_x86_64=('7446d4a7eeaef5eb67e808ffd95f67f2e049a63ae8e1062ae1b7c6bc68ceb556')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"
	rm -rf "${pkgdir}/usr/share/doc"
	mv "${pkgdir}/usr/share/icons/hicolor/2048x2048" "${pkgdir}/usr/share/icons/hicolor/512x512"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
