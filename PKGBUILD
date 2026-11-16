# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=alexylon
_gitname=ferrocrypt
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A pure Rust CLI, and desktop application for encrypting and decrypting files and folders using password-based or key-pair-based encryption"

pkgver=0.4.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}"{,-desktop})
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'fontconfig' 'hicolor-icon-theme')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-cli-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-cli-${_barch[0]}.tar.gz"
			   "${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.deb")
sha256sums=('b4a3d56a22c89420760fc8976167ab739d29d6b2d9d6034b798b2e40cd4fe744'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('99802fb402285372113f963381d1ecd1bc1f781115b3887d5ec9d230921d002c'
                   '1e902bf6bf9abd655000ec42dd281246933678c5280c764defe9d797f5d5630a')


prepare() {
	cd "${srcdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "usr/bin/${_appname}-desktop" "${pkgdir}/usr/bin/${_appname}-desktop"

	install -Dm644 "usr/lib/${_appname}-desktop/assets/app_icon.png" "${pkgdir}/usr/lib/${_appname}-desktop/assets/app_icon.png"

	install -Dm644 "usr/share/applications/${_appname}-desktop.desktop" "${pkgdir}/usr/share/applications/${_appname}-desktop.desktop"

	install -Dm644 "usr/share/icons/hicolor/512x512/apps/${_appname}-desktop.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}-desktop.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
