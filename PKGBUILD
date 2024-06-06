# Maintainer: Kimiblock Moe
pkgname=(wechat-uos-bwrap wechat-uos-qt)
pkgver=1.0.0.241
pkgrel=9
epoch=
pkgdesc="WeChat Qt"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com/"
license=('LicenseRef-proprietary')
groups=()
options=(!debug)

depends=(
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
)

optdepends=("gamescope")

makedepends=(
	"libarchive"
)

checkdepends=()
conflicts=()
replaces=("wechat-universal-bwrap" "wechat-beta-bwrap")

source=(
	wechat.sh
	wechat-uos-qt.desktop
	wechat-uos-qt.svg
	open.sh
	license.tar.gz
	user-dirs.dirs
	wechat.env
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

md5sums=('42824c2a866111605ca1a4ba2deee7a5'
         '8f4a19a88facd8d7d6d49f2fab94d70c'
         '600e74549ce2258c045d5c2f7689ea63'
         'dfc069e6c8d9dbaa90fe388cab4002c9'
         '6b159c6e9d21a98925489bc37a9aea43'
         '38e98220da64adc1d8f9dc17d04b3a39'
         '17a2d0ee9d05053f7e34a96a82ca62f6')
md5sums_x86_64=('2c2c8ec69b6b798b7ccaf873e27d977a')
md5sums_aarch64=('c4d443515fe76ec35e792d43e9521887')
md5sums_loong64=('c4d443515fe76ec35e792d43e9521887')

function package_wechat-uos-qt() {
	conflicts=(wechat-universal-bwrap wechat-beta-bwrap)
	replaces+=(wechat-universal-bwrap wechat-beta-bwrap wechat-uos-bwrap)
	provides=("wechat-uos" "wechat" "wechat-universal" "wechat-universal-bwrap" "wechat-beta-bwrap")
	tar -xf data.tar.xz ./opt/apps/com.tencent.wechat
	mkdir -p "${pkgdir}"/opt
	cp opt/apps/com.tencent.wechat "${pkgdir}"/opt/wechat-uos-qt -r
	install -Dm644 wechat-uos-qt.desktop "${pkgdir}/usr/share/applications/wechat-uos-qt.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-uos-qt"
	install -Dm644 user-dirs.dirs "${pkgdir}/usr/lib/wechat-uos-qt/user-dirs.dirs"
	install -Dm755 open.sh "${pkgdir}/usr/lib/wechat-uos-qt/open"
	install -Dm644 wechat.env "${pkgdir}/usr/lib/wechat-uos-qt/envs"
	install -Dm644 wechat-uos-qt.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-qt.svg"
	mkdir -p "${pkgdir}/usr/share/wechat-uos-qt/license"
	install -d "${pkgdir}/usr/lib/license"
	chmod 0755 "${pkgdir}/usr/lib/license" -R
	cp "${srcdir}/license"/* -r "${pkgdir}/usr/share/wechat-uos-qt/license"
	chmod 0755 -R "${pkgdir}/usr/share/wechat-uos-qt/license"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo "https://www.wechat.com/us/service_terms.html" >"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
}

function package_wechat-uos-bwrap() {
	conflicts=()
	requires+=(wechat-uos-qt)
}
