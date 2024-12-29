# Maintainer: Kimiblock Moe
# Contributor: wszqkzqk

pkgname=wechat
pkgver=4.0.1.7
pkgrel=2
epoch=
pkgdesc="微信是一种生活方式. This is a repackage of the official WeChat which includes an optional sandbox support"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com/"
license=('LicenseRef-proprietary')
groups=()
options=(!debug !strip)

makedepends+=()

provides+=(wechat-uos wechat-bin wechat-universal)
conflicts+=(wechat-uos wechat-bin wechat-universal)

replaces+=("wechat-bin")

depends=(
	"nss"
	"xcb-util-renderutil"
	"xcb-util-keysyms"
	"xcb-util-image"
	"xcb-util-wm"
	"libxkbcommon-x11"
	"libxkbcommon"
	"libxcb"
	"gcc-libs"
	"nspr"
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
	"libjack.so"
	"libxdamage"
	"libdrm"
	"mesa"
	"bash"
	"libglvnd"
)

optdepends=(
	"wechat-sandbox-provider: Sandbox support"
	'ttf-twemoji: An emoji font that will work with WeChat'
	'at-spi2-core: accessibility'
	'orca: screen reader'
	'libpulse'
	"hicolor-icon-theme"
)

makedepends+=(
	"libarchive"
)

checkdepends=()

source=(
	wechat.sh
	wechat.desktop
	wechat.svg
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


md5sums=('289f5a646504a8ac5a9ab6a2dcff969a'
         'caa351d13a96f34bee10ed171e7d520d'
         '468e0367346707c026e577e7bf3e3a82')
md5sums_x86_64=('ed17e297694a869073a4880d7f820703')
md5sums_aarch64=('15e9b016912a1f040ee5f818d3f21ba0')
md5sums_loong64=('15e9b016912a1f040ee5f818d3f21ba0')

function pkgver() {
	tar -xf control.tar.xz ./control
	cat control | grep 'Version: ' | cut -c '10-'
}

function package_wechat() {
	tar -xf data.tar.xz ./opt
	cp -r opt \
		"${pkgdir}/"
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
