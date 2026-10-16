# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=MarketKernel
_gitname=disk-usage
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast and lightweight disk usage analyzer written in Rust, with a simple visual representation of what takes up space on your disk"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'hicolor-icon-theme')

options=('!strip')

source=("LAUNCHER-${pkgver}.desktop::${_ghurlraw}/assets/${_appname}.desktop"
		"ICON_256-${pkgver}.png::${_ghurlraw}/assets/icon-256.png"
		"ICON_1024-${pkgver}.png::${_ghurlraw}/assets/icon.png"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('8d7e526b9f599a90ef72e13c0ad4b23ad8af62422c00f79c757546635b339504'
            '5021972e84dc95e4c62e15e9271b7ee69a544bc6798908172d63ab77e1e94958'
            'a77f8cf31c13e09f3521c37c388514cf6a726570c1bea606d287299fa715d9e9'
            '5faa2bac8ea965f25909a325b426eccde4f9b4cf18b1b77ced8233c85e00761f'
            '6340433613197bab9d5298318a673638e16e537e29ea9780133b8a72087f434e')
sha256sums_x86_64=('2022a260606e65f5fb8a6c8228d1e172c69dafbf9f555406d35611eeb049ade4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

	install -Dm644 "ICON_256-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png"
	install -Dm644 "ICON_1024-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_appname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
