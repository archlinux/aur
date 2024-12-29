# Maintainer: Kimiblock Moe

pkgname=wechat-bwrap
pkgver=4
pkgrel=1
epoch=1
pkgdesc="Sandboxing for WeChat. 沙盒微信."
arch=('any')
url="https://github.com/Kraftland/portable"
license=('GPL3')
groups=()
options=(!debug !strip)

makedepends+=()

provides+=(wechat-uos-bwrap wechat-uos-qt wechat-universal-bwrap wechat-bwrap wechat-portable wechat-beta-bwrap wechat-sandbox-provider)

depends=("wechat" "portable")

optdepends=()

makedepends+=()

checkdepends=()

source=(
	portable-config
)


md5sums=('079a55fcd28b9a4f1efbc1a9e1d9279c')

function package() {
	install -Dm644 portable-config \
		"${pkgdir}/usr/lib/wechat/portable-config"
	install -d "${pkgdir}/usr/bin"
	echo '''#!/usr/bin/bash
export _portalConfig=/usr/lib/wechat/portable-config
portable $@
''' >"${pkgdir}/usr/bin/wechat-sandbox-provider"
	chmod 755 "${pkgdir}/usr/bin/wechat-sandbox-provider"
	echo '''[Desktop Entry]
Comment=WeChat
Comment[zh_CN]=微信
Exec=/usr/bin/wechat.sh %u
Icon=wechat
Name=WeChat
Name[zh_CN]=微信
Categories=Utility;Network;InstantMessaging;Chat;
Terminal=false
Type=Application
Keywords=wechat;weixin;we;w;
Keywords[zh_CN]=微;微信;wechat;weixin;we;w;
X-GNOME-SingleWindow=true
SingleMainWindow=true
Actions=nosandbox;opendir;
StartupWMClass=wechat
StartupNotify=true
X-Flatpak-RenamedFrom=wechat.desktop;
X-Flatpak-Tags=proprietary;
X-Flatpak=com.qq.weixin;

[Desktop Action nosandbox]
Name=Toggle Sandbox...
Name[zh_CN]=更改沙盒偏好...
Exec=/usr/bin/wechat.sh --actions f5aaebc6-0014-4d30-beba-72bce57e0650
Icon=security-low-symbolic

[Desktop Action opendir]
Name=Open WeChat Home
Name[zh_CN]=打开数据目录
Exec=/usr/bin/wechat.sh --actions opendir
Icon=insert-image-symbolic''' >"${pkgdir}/usr/lib/wechat/alt.desktop"
}

