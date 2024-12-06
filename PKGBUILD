# Maintainer: Kimiblock Moe
pkgname=wechat
pkgver=4.0.0.30
pkgrel=1
epoch=
pkgdesc="微信是一种生活方式. 可选沙盒支持."
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com/"
license=('LicenseRef-proprietary')
groups=()
options=(!debug !strip)

makedepends+=()

provides+=(wechat-uos wechat-uos-bwrap wechat-uos-qt wechat-bin wechat-universal wechat-universal-bwrap wechat-bin)
replaces+=(wechat-uos wechat-uos-bwrap wechat-uos-qt wechat-bin wechat-universal wechat-universal-bwrap wechat-bin)

depends=(
	"portable"
	"nss"
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
	"libvlc"
	"jack"
	"libxdamage"
	"libdrm"
	"mesa"
	"bash"
	"lsb-release"
	"psmisc"
)

optdepends=(
	'ttf-twemoji: An emoji font that will work with WeChat'
	'at-spi2-core: accessibility'
	'orca: screen reader'
	'libpulse'
	'libglvnd'
)

makedepends+=(
	"libarchive"
)

checkdepends=()

source=(
	wechat.sh
	wechat.desktop
	wechat.svg
	portable-config
)

source_x86_64=(
	wechat-x86-${pkgver}.deb::"https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb"
)

source_aarch64=(
	wechat-arm-${pkgver}.deb::"https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.deb"
)

source_loong64=(
	wechat-loong64-${pkgver}.deb::"https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_LoongArch.deb"
)


md5sums=('c49cd9a8142a736a45276cac413f43f7'
         'ff710cd32cb665a70b06f6f0f83937c5'
         '468e0367346707c026e577e7bf3e3a82'
         'SKIP')
md5sums_x86_64=('SKIP')
md5sums_aarch64=('SKIP')
md5sums_loong64=('SKIP')

function package_wechat() {
	conflicts=()
	replaces+=(wechat-universal-bwrap wechat-beta-bwrap wechat-uos-bwrap)
	tar -xf data.tar.xz ./opt
	cp -r opt \
		"${pkgdir}/"
	install -Dm644 portable-config \
		"${pkgdir}/usr/lib/wechat/portable-config"
	install -Dm644 wechat.desktop \
		"${pkgdir}/usr/share/applications/com.qq.weixin.desktop"
	install -Dm755 wechat.sh \
		"${pkgdir}/usr/bin/wechat.sh"
	install -Dm644 wechat.svg \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat.svg"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	echo "https://www.wechat.com/us/service_terms.html" \
		>"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
}
