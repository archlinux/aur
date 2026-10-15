# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=not-elm
_gitname=orzma
_appname=(orzma orzmd orzbrowser)
pkgname=${_gitname}-bin
pkgdesc="A terminal emulator that can render webviews inline"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname[@]}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'glib2' 'mesa' 'pango' 'dbus' 'expat' 'cairo' 'nss' 'nspr' 'systemd-libs' 'libxfixes' 'wayland' 'alsa-lib' 'at-spi2-core' 'libxdamage' 'libxrandr' 'libxcb' 'libxcomposite' 'libcups' 'libxext' 'libxkbcommon' 'libx11' 'fontconfig' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('e56eedd1d2aa8b3ad033a5036626b8a00cfca168030d1d0a5c5f8fc9e11024be'
            'af7d47a6b65781c7c7a0d74afb983b788a4243e75ad3c52e70fae08585a7de78')
sha256sums_x86_64=('28ce3b4bcb63f202c026b6a8ac10c70bb6978a34ea687ecc558103873805a8c9')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.xz"
	mv "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/licenses"
	mv "${pkgdir}/usr/share/licenses/${_gitname}" "${pkgdir}/usr/share/licenses/${pkgname}"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
