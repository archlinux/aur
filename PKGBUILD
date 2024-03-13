# Maintainer: Kimiblock Moe
pkgname=wechat-uos-bwrap
pkgver=1.0.0.236
pkgrel=3
epoch=
pkgdesc="WeChat UOS with bwrap sandbox"
arch=('x86_64' 'aarch64')
url="https://weixin.qq.com/"
license=('proprietary')
groups=()
depends=('nss' 'bubblewrap' 'xcb-util-renderutil' 'xcb-util-keysyms' 'xcb-util-image' 'xcb-util-wm' 'libxkbcommon-x11' 'util-linux' "openssl-1.1")
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()

source=(
	wechat.sh
	wechat-uos-beta.desktop
	wechat-uos-beta.svg
	open.sh
	license.tar.gz
)

md5sums=('ff72c19fab2405f0405e0b669e22a992'
         'b6e6920af829dafb0be82da1c79e46a9'
         '600e74549ce2258c045d5c2f7689ea63'
         'b3acc2c95d35bd2fa41e5a8f1a6339ec'
         '6b159c6e9d21a98925489bc37a9aea43')

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
