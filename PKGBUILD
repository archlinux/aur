# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
pkgname=com.qq.weixin.spark
pkgver=3.9.10deepin1.1
pkgrel=1
pkgdesc="Tencent WeChat Client from Spark Store"
arch=('x86_64')
_arch=all
url="https://weixin.qq.com/"
license=('unknown')
depends=(
	'bash'
	'hicolor-icon-theme'
	'glibc'
	'libx11'
	'libxext'
	'mejituu-wine8'
	'spark-dwine-helper'
	'xdg-utils'
)
optdepends=(
	'wqy-microhei: Recommended font'
	'wqy-zenhei: Recommended font'
)
conflicts=('com.qq.weixin.dcs')
replaces=('com.qq.weixin.dcs')
# install=wechat.install
# _mirror="https://cdn.d.store.deepinos.org.cn"					# Main server, currently unavailable
_mirror="https://d.spark-app.store"		# SDU mirror, sometimes outdated
source=("${_mirror}/store/chat/${pkgname}/${pkgname}_${pkgver}_${_arch}.deb")
b2sums=('e738daf865e2479308910b68437b85942d4ad1ceaaf22f91c75ce500467a8e23c613ff22d447deeaecfeae3ac15fb37e9065edf559843352e0f3a11345d72479')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	# sed -i 's/"deepin-wine8-stable"/"wine"/' opt/apps/${pkgname}/files/run.sh
	sed -i 's/WeChat.exe/wechat.exe/' usr/share/applications/${pkgname}.desktop
	rmdir opt/apps/${pkgname}/entries/
	rm opt/apps/${pkgname}/info
	chown -R root:root .
}
