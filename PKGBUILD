# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=johniak
_pkgname=GitArbor
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="A modern graphical Git client for Linux, macOS, and Windows"

pkgver=0.12.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'libstdc++' 'libx11' 'dbus' 'libcups' 'systemd-libs' 'libxdamage' 'libxfixes' 'libxcb' 'pango' 'libgcc' 'nss' 'nspr' 'at-spi2-core' 'alsa-lib' 'expat' 'libxkbcommon' 'libxrandr' 'cairo' 'glib2' 'libxcomposite' 'gtk3' 'mesa' 'libxext' 'vulkan-icd-loader' 'hicolor-icon-theme')

options=(!strip)

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('1ef0c94cfaadcdddfc416aa1a09c0bb799e758bb952fbf2deee9475242d50bf9'
            '8ab973ce6c8a406350fed1f451e1300f0795b5332e98a86b4c11e881cca8dc1b')
sha256sums_x86_64=('04a76281a4bb0b8e2e4c425b9c406c877b62ad8f3229d1e5036bf334aeee92d8')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.zst"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
