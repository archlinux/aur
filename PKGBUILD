# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>
# Contributor: witt <1989161762 at qq dot com>

_gitauthor=Wox-launcher
_gitname=Wox
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A cross-platform launcher that simply works"

pkgver=2.4.0
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
sha256sums=('511422ab2089f7960801c86a599b8c6b83a667130e3ac1f79e8410ca9a4cea46'
            '38a27a633c153a32015ff1d026aa55bb049c021411db30d48167c74ee348dfdd'
            'bca755dff021b2bd00fe1af51053cb2e9b78395b556914af92315160e26eae82'
            '8475252f3dafb9b1a132511d368806daff74275050afcb425e743058f8a6c83c')
sha256sums_x86_64=('fb8d635cb0acf87925858a8ca9656b3a628afee0a22b06695ad086c1a9ed01d9')

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
