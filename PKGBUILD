# Maintainer: spookioi <spookioi@posteo.net>

pkgname="popcornfx-editor"
pkgver="2.21.1.23070"
pkgrel="1"
pkgdesc="The PopcornFX Editor is a suite of tools dedicated to effects creation and management of related assets."
arch=('x86_64')
url="https://www.popcornfx.com"
license=('LicenseRef-PopcornFX')
depends=(vulkan-icd-loader sdl2 libxcomposite
	 libxkbcommon libxkbcommon-x11 xcb-util-keysyms xcb-util-renderutil xcb-util-wm xcb-util-image dbus fontconfig)
optdepends=()
conflicts=()

source=(popcornfx-editor.sh
	popcornfx-editor.desktop
	LICENSE.txt
	"$pkgname.png::https://media.githubusercontent.com/media/PopcornFX/UnrealEnginePopcornFXPlugin/e8f59d38a24ee11abf0fdf45ba558458e3da3597/Resources/Icon128.png")
sha256sums=('a52f622e27ced8f43f323d48dd29bc5fdfd3f179e9dafb14d7e91b2e329aeb73'
            'c9c2d53150158420fcd78511fc44dd2d7f84d410ee8756e3994b845755137e94'
            '24af1a60c41e710f58c111a7c1378b225bea16467ae58179363f078723e41e01'
            'aefc707db5a86ec4de4dfe849dd1a7f7b679ad4e44a9654536336f0e279da08a')
source_x86_64=("$pkgname-$pkgver.tgz::https://releases.popcornfx.com/2.21.1.23070_679/PopcornFX-Editor_v2.21.1.23070_x64.tgz")
sha256sums_x86_64=('34b09546f3470a89ffbeed51bb13fcc6cbaebbcbca683ba4f36f56b145f9af12')

package() {
	_pkg=PK-Editor

	# Create directories
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/icons"
	install -d "${pkgdir}/opt/${pkgname}"

	# Install
	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${pkgname}"

	# Fix permissions
	chmod -R go=u "${pkgdir}/opt/${pkgname}"
    	chmod -R go-w "${pkgdir}/opt/${pkgname}"

	# Launcher
	install -m755 "${srcdir}/popcornfx-editor.sh" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

	# Icons
	install -m644 "${srcdir}/popcornfx-editor.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

	# Desktop
	install -m644 "${srcdir}/popcornfx-editor.desktop" "${pkgdir}/usr/share/applications/popcornfx-editor.desktop"
}

