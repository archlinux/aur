# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=0-AI-UG
_gitname=cate
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A spatial desktop IDE with an infinite canvas for code, terminals, browsers, and git"

pkgver=2.1.1
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
sha256sums=('4f655fc6fac05f7797684c1cfc29d83cf1973d1439c1293e6bc490a208a345e3'
            '1e585acefe712004c775251ae0146fc72ac59fc776851b0bc227130f429d585c')
sha256sums_x86_64=('35f02bc546926bf9cbbcc1cd81b6ad6998d2e81c2339c0d049b888a72edcdf2a')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.xz"

	install -dm755 "${pkgdir}/usr/bin" && ln -sf "/opt/Cate/${_appname}" "${pkgdir}/usr/bin/"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
