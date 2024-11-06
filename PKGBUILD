# Maintainer: Kimiblock Moe
pkgname=wechat
pkgver=4.0.0.21
pkgrel=6
epoch=
pkgdesc="微信是一种生活方式. 可选沙盒支持."
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com/"
license=('LicenseRef-proprietary')
groups=()
options=(!debug !strip)

makedepends+=()

depends=(
	#"wechat-uos-qt"

	"xdg-user-dirs"
	"xorg-xhost"
	"findutils"
	"zenity"
	"xdg-dbus-proxy"
	"nss"
	"bubblewrap"
	"xcb-util-renderutil"
	"xcb-util-keysyms"
	"xcb-util-image"
	"xcb-util-wm"
	"libxkbcommon-x11"
	"libxkbcommon"
	"libxcb"
	"util-linux"
	"openssl-1.1"
	"libxcb"
	"gcc-libs"
	"nspr"
	"bzip2"
	"glibc"
	"zlib"
	"libxcomposite"
	"glib2"
	"wayland"
	"libxrender"
	"libxext"
	"alsa-lib"
	"dbus"
	"libxrandr"
	"fontconfig"
	"pango"
	"freetype2"
	"libxfixes"
	"cairo"
	"libx11"
	"expat"
	"at-spi2-core"
	"libxdamage"
	"libdrm"
	"mesa"
	"hicolor-icon-theme"
	"bash"
	"lsb-release"
	"psmisc"
	"wmctrl"
	"flatpak-xdg-utils"
	"xdg-desktop-portal"
	"xdg-desktop-portal-gtk"
)

optdepends=(
	'wechat-key-block: Block keyboard shortcuts'
	'ttf-twemoji: An emoji font that will work with WeChat'
	'at-spi2-core: accessibility'
	'orca: screen reader'
)

makedepends+=(
	"libarchive"
)

checkdepends=()
replaces=("wechat-universal-bwrap" "wechat-beta-bwrap" "wechat")

source=(
	wechat.sh
	wechat.desktop
	wechat.svg
	open.sh
	license.tar.gz
	user-dirs.dirs
	wechat.env
	mimeapps.list
	flatpak-info
)

source_x86_64=(
	wechat-x86-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}_amd64.deb"
)

source_aarch64=(
	wechat-arm-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}_arm64.deb"
)

source_loong64=(
	wechat-loong64-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}_arm64.deb"
)


md5sums=('424db725e68df56ea13aa65775235e3d'
         '89ae77c95f205d0a7f9347f8251ce742'
         '468e0367346707c026e577e7bf3e3a82'
         'b48d860c2d03ddb4ffa609fcd5fe6857'
         '6b159c6e9d21a98925489bc37a9aea43'
         '38e98220da64adc1d8f9dc17d04b3a39'
         'f044a73143ff8d4b4c4bf21d041e852e'
         'e821fd2d05d6d39c7ecf118916922414'
         'e472d6dd49522bc90fdaf0b4adcdb744')
md5sums_x86_64=('b2df207e4a27c1a2930c1b07a62332d0')
md5sums_aarch64=('6e34513d6781c7698ea53c7efcf216a8')
md5sums_loong64=('6e34513d6781c7698ea53c7efcf216a8')

function package_wechat() {
	conflicts=()
	replaces+=(wechat-universal-bwrap wechat-beta-bwrap wechat-uos-bwrap)
	tar -xf data.tar.xz ./opt/apps/com.tencent.wechat
	mkdir -p "${pkgdir}"/opt
	cp -r opt/apps/com.tencent.wechat \
		"${pkgdir}"/opt/wechat
	install -Dm644 wechat.desktop \
		"${pkgdir}/usr/share/applications/wechat.desktop"
	install -Dm755 wechat.sh \
		"${pkgdir}/usr/bin/wechat.sh"
	install -Dm644 user-dirs.dirs \
		"${pkgdir}/usr/lib/wechat/user-dirs.dirs"
	install -Dm755 open.sh \
		"${pkgdir}/usr/lib/wechat/open"
	install -Dm644 wechat.env \
		"${pkgdir}/usr/lib/wechat/envs"
	install -Dm644 wechat.svg \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat.svg"
	install -Dm644 mimeapps.list \
		"${pkgdir}/usr/lib/wechat/mimeapps.list"
	mkdir -p \
		"${pkgdir}/usr/share/wechat/license"
	install -d "${pkgdir}/usr/lib/license"
	chmod 0755 "${pkgdir}/usr/lib/license" -R
	cp "${srcdir}/license"/* -r "${pkgdir}/usr/share/wechat/license"
	chmod 0755 -R "${pkgdir}/usr/share/wechat/license"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo "https://www.wechat.com/us/service_terms.html" \
		>"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
	install -Dm644 "${srcdir}/flatpak-info" \
		"${pkgdir}/usr/lib/wechat/flatpak-info"
}
