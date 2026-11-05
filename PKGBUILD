# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=devlinx9
_gitname=muon-ssh
_appname=${_gitname//-/}
pkgname=${_gitname}-bin
pkgdesc="Graphical SFTP client and terminal emulator (SSH) with helpful utilities."

pkgver=3.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('bash' 'java-runtime>=11')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}.deb")
sha256sums=('c0c6638f8af8b96f7e020da41f659c1e5c7c21b19905e93e48561b375f90e69f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('d97db21c3b868218649f57f63308e62266cd22c97c522c2aed659cbfa85e5976')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"

	echo "Terminal=false" >> "${pkgdir}/usr/share/applications/${_appname}.desktop"
	echo "Comment=${pkgdesc}" >> "${pkgdir}/usr/share/applications/${_appname}.desktop"
	echo "Categories=Network;FileTransfer;" >> "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
