# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pickywawa
_gitname=cyberdog
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Modern SSH/SFTP manager: file explorer, terminal, server health dashboard and quick actions"

pkgver=1.17.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++' 'bash' 'gtk3' 'glib2' 'systemd-libs' 'nss' 'pango' 'libxext' 'dbus' 'mesa' 'alsa-lib' 'libxcb' 'libxrandr' 'libx11' 'libxfixes' 'libxdamage' 'libxkbcommon' 'libxcomposite' 'at-spi2-core' 'expat' 'cairo' 'nspr' 'libcups' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname^}-${pkgver}-${_barch[0]}.deb")
sha256sums=('4ad55eac517fe3d1c79f8e4c9080223e2ba09d67be2e917ca08469a852c1d684'
            '6fb2a4ba14ccdf8691158f5dae6eb13e4381be8070f2d78182efbd4239cc4f68')
sha256sums_x86_64=('33a9dbfd7a7a4b6e0b64bc61f445b131e2ae71ab7cdf8eeafa09ffc024df3a7b')


packageX() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.xz" --exclude="usr/share/doc"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
