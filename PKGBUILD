# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=0-AI-UG
_gitname=cate
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A spatial desktop IDE with an infinite canvas for code, terminals, browsers, and git"

pkgver=1.7.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'expat' 'libcups' 'python' 'nss' 'libxcb' 'alsa-lib' 'mesa' 'at-spi2-core' 'libxdamage' 'cairo' 'libx11' 'systemd-libs' 'pango' 'dbus' 'gtk3' 'hicolor-icon-theme' 'bash' 'libxext' 'libxkbcommon' 'libxfixes' 'libxcomposite' 'libxrandr' 'nspr')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('c3da971b1e8958457bf7d276c7f0f8cf12e44aa6ecec3345a57fa00c1b6574fc'
            '1e585acefe712004c775251ae0146fc72ac59fc776851b0bc227130f429d585c')
sha256sums_x86_64=('ae01c7a64c9dd69b3f84f517a1d643fcfeb3bc65b6078a78f1f90792542da63d')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.xz"

	install -dm755 "${pkgdir}/usr/bin" && ln -sf "/opt/Cate/${_appname}" "${pkgdir}/usr/bin/"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
