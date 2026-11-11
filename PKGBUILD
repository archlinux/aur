# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=alexylon
_gitname=ferrocrypt
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A pure Rust CLI, and desktop application for encrypting and decrypting files and folders using password-based or key-pair-based encryption"

pkgver=0.3.1
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
sha256sums=('c5ce62ad0079007ca42fe5a518e3f4e237918b3e8022e66bd844f913a30c6862'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('75019feacac909c41ff086bd392d6ef9f514fa3bfffa75160bd0058c514900fd'
                   'ed4a69fc0ea5d61b1b32d5cbba33e5d7ae11f065bf2b23e8ed6cff6e45a6e03f')


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
