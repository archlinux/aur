# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danielravina
_gitname=stemkit
_appname=StemKit
pkgname=${_gitname}-bin
pkgdesc="Split any YouTube song into stems"

pkgver=0.2.0
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
sha256sums=('f3bbfe8262a0b5066486104cfdb04bccadd2818a27b4e0a4474764e51402e8b4'
            'acd462c0d190620860abbd07aa158091d2b8db7083b9fb193c4e243faf9a05de')
sha256sums_x86_64=('c1d5246a85950e52b6ed2c3d2821382ca3e660366025ed183c0f31449835d85b')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"
	rm -rf "${pkgdir}/usr/share/doc"
	mv "${pkgdir}/usr/share/icons/hicolor/2048x2048" "${pkgdir}/usr/share/icons/hicolor/512x512"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
