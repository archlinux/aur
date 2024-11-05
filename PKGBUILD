# Maintainer: Kimiblock Moe
pkgname=(wechat-uos-bwrap wechat-uos-qt wechat-key-block)
pkgver=114514
pkgrel=1
epoch=
pkgdesc="WeChat Qt, the so-called universal version"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com/"
license=('LicenseRef-proprietary')
groups=()
options=(!debug !strip lto)

makedepends+=(
		"ninja"
		"cmake"
	)

depends=(
	"wechat>4"

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
)

makedepends+=(
	"libarchive"
	"cmake"
)

checkdepends=()
replaces=("wechat-universal-bwrap" "wechat-beta-bwrap")

source=(
	keyBlocker.cpp
	CMakeLists.txt
)

function build() {
	cd "${srcdir}"
	mkdir key-block -p
	cd key-block
	cp "${srcdir}"/{keyBlocker.cpp,CMakeLists.txt} "${srcdir}"/key-block/
	cmake -S . -B build -G "Ninja"
	cmake --build build
}

function package_wechat-key-block() {
	license=("CC-BY-SA-4.0")
	url="https://alampy.com/2024/07/15/block-hotkeys-for-wechat-uos/"
	pkgdesc="Block WeChat's hotkeys"
	install -Dm755 "${srcdir}"/key-block/build/keyBlocker.so \
		"${pkgdir}/usr/lib/wechat-uos-qt/keyBlocker.so"
}

function package_wechat-uos-qt() {
# 	conflicts=()
# 	replaces+=(wechat-universal-bwrap wechat-beta-bwrap wechat-uos-bwrap)
# 	tar -xf data.tar.xz ./opt/apps/com.tencent.wechat
# 	mkdir -p "${pkgdir}"/opt
# 	cp -r opt/apps/com.tencent.wechat \
# 		"${pkgdir}"/opt/wechat-uos-qt
# 	install -Dm644 wechat-uos-qt.desktop \
# 		"${pkgdir}/usr/share/applications/wechat-uos-qt.desktop"
# 	install -Dm755 wechat.sh \
# 		"${pkgdir}/usr/bin/wechat-uos-qt"
# 	install -Dm644 user-dirs.dirs \
# 		"${pkgdir}/usr/lib/wechat-uos-qt/user-dirs.dirs"
# 	install -Dm755 open.sh \
# 		"${pkgdir}/usr/lib/wechat-uos-qt/open"
# 	install -Dm644 wechat.env \
# 		"${pkgdir}/usr/lib/wechat-uos-qt/envs"
# 	install -Dm644 wechat-uos-qt.svg \
# 		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-qt.svg"
# 	install -Dm644 mimeapps.list \
# 		"${pkgdir}/usr/lib/wechat-uos-qt/mimeapps.list"
# 	mkdir -p \
# 		"${pkgdir}/usr/share/wechat-uos-qt/license"
# 	install -d "${pkgdir}/usr/lib/license"
# 	chmod 0755 "${pkgdir}/usr/lib/license" -R
# 	cp "${srcdir}/license"/* -r "${pkgdir}/usr/share/wechat-uos-qt/license"
# 	chmod 0755 -R "${pkgdir}/usr/share/wechat-uos-qt/license"
# 	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
# 	echo "https://www.wechat.com/us/service_terms.html" \
# 		>"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
# 	install -Dm644 "${srcdir}/flatpak-info" \
# 		"${pkgdir}/usr/lib/wechat-uos-qt/flatpak-info"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo "https://www.wechat.com/us/service_terms.html" >"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
}

function package_wechat-uos-bwrap() {
	conflicts=()
	depends+=(wechat-uos-qt)
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo "https://www.wechat.com/us/service_terms.html" >"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
}
sha256sums=('1d6e49cb4fae10a8fbfe29507544937f390e9c1acaffee3a4363fad268e94b68'
            '0fe7b98442e5d6d5196818805b13e226b9476886e2c1514b27f0232aacd6b8de')
