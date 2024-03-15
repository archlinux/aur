# Maintainer: Kimiblock Moe
pkgname=wechat-uos-bwrap
pkgver=1.0.0.238
pkgrel=1
epoch=
pkgdesc="WeChat UOS with bwrap sandbox"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com/"
license=('proprietary')
groups=()

depends=(
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
)

optdepends=(
	"qt5-base: iBus support"
)

makedepends=(
	"libarchive"
)

checkdepends=()
provides=("wechat-uos")
conflicts=()
replaces=()

source=(
	wechat.sh
	wechat-uos-beta.desktop
	wechat-uos-beta.svg
	open.sh
	license.tar.gz
)

source_x86_64=(
	wechat-x86-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_1.0.0.238_amd64.deb"
)

source_aarch64=(
	wechat-arm-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_1.0.0.238_arm64.deb"
)

source_loong64=(
	wechat-loong64-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_1.0.0.238_arm64.deb"
)

md5sums=('09bb2ace24d1399dbe60025f9dd8026d'
         'b6e6920af829dafb0be82da1c79e46a9'
         '600e74549ce2258c045d5c2f7689ea63'
         'e49130d3e6185335db9a60f31d4b7429'
         '6b159c6e9d21a98925489bc37a9aea43')
md5sums_x86_64=('aa52e39afd9c16eee7f924093ce4c5b6')
md5sums_aarch64=('280d9b202390954c011dbd12e28f892d')
md5sums_loong64=('280d9b202390954c011dbd12e28f892d')


function prepare() {
	tar -xf data.tar.xz ./opt/apps/com.tencent.wechat
}

function package() {
	mkdir -p "${pkgdir}"/opt
	cp opt/apps/com.tencent.wechat "${pkgdir}"/opt/wechat-uos-bwrap -r
	install -Dm644 wechat-uos-beta.desktop "${pkgdir}/usr/share/applications/wechat-uos-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-uos-beta"
	install -Dm755 open.sh "${pkgdir}/usr/lib/wechat-uos-bwrap/open"
	install -Dm644 wechat-uos-beta.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-beta.svg"
	mkdir -p "${pkgdir}/usr/share/wechat-uos-bwrap/license"
	install -Dm755 "${pkgdir}/opt/wechat-uos-bwrap/files/libuosdevicea.so" "${pkgdir}/usr/lib/license/libuosdevicea.so"
	cp "${srcdir}/license"/* -r "${pkgdir}/usr/share/wechat-uos-bwrap/license"
	chmod 0755 -R "${pkgdir}/usr/share/wechat-uos-bwrap/license"
}
