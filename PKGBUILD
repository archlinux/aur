# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: witt <1989161762 at qq dot com>

_gitauthor=Wox-launcher
_gitname=Wox
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A cross-platform launcher that simply works"

pkgver=2.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libxtst' 'libx11' 'libxrandr' 'glib2' 'gtk3' 'fontconfig' 'cairo' 'pango' 'gdk-pixbuf2' 'libayatana-appindicator' 'hicolor-icon-theme')

options=(!strip)

source=("LAUNCHER-${pkgver}.desktop::${_ghurlraw}/assets/linux/${_appname}.desktop"
		"ICON-${pkgver}.png::${_ghurlraw}/assets/app.png"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('0a702c8e94e82e991a6395aaade51b929d4778092f3fcae759663d239dda733d'
            '38a27a633c153a32015ff1d026aa55bb049c021411db30d48167c74ee348dfdd'
            'dddf1357640b87b3f5da28ed58df468082ac068d04f28f695f4ffec6892f4689'
            '8475252f3dafb9b1a132511d368806daff74275050afcb425e743058f8a6c83c')
sha256sums_x86_64=('eb65a7e29c51366ff00d118c76dec682d2e23d35cd266ba8773dd0e161f734ee')

_appid="io.github.WoxLauncher.Wox"

prepare() {
	cd "${srcdir}/" || exit

	sed -e "s/Icon=.*/Icon=${_appid}/g" -e "/Name=/a Comment=A cross-platform launcher that simply works" -i "LAUNCHER-${pkgver}.desktop"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LAUNCHER-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"

	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_appid}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
