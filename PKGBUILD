# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
pkgname=com.qq.weixin.spark
pkgver=3.7.5.11spark7
pkgrel=2
pkgdesc="Tencent WeChat Client from Spark Store"
arch=('i686' 'x86_64')
url="https://weixin.qq.com/"
license=('unknown')
depends=(
	# 'deepin-wine6-stable'
	# 'deepin-wine-helper'
	'lib32-libxext'
	'spark-dwine-helper'
	'wine'
	'xdg-utils'
)
optdepends=(
	'wqy-microhei: Recommended font'
	'wqy-zenhei: Recommended font'
)
conflicts=('com.qq.weixin.dcs')
replaces=('com.qq.weixin.dcs')
# install=wechat.install
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
b2sums=('bf1399eec3e2a753b8ecd338c5eecccc4bc287c96178db4fb060eebfbf8c856cdb72c1152de19c6c7d0706e6c8fb142d997da34ca8dbabdfd6893e123b6c0c5d')
options=('!strip')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	sed -i 's/"deepin-wine6-stable"/"wine"/' opt/apps/${pkgname}/files/run.sh
	sed -i 's/WeChat.exe/wechat.exe/' usr/share/applications/${pkgname}.desktop
	rmdir opt/apps/${pkgname}/entries/
	rm opt/apps/${pkgname}/info
}
