# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
pkgname=com.qq.weixin.spark
pkgver=3.8.0.41spark9
pkgrel=1
pkgdesc="Tencent WeChat Client from Spark Store"
arch=('i686' 'x86_64')
url="https://weixin.qq.com/"
license=('unknown')
depends=(
	# 'deepin-wine6-stable'
	# 'deepin-wine-helper'
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
#_mirror="https://d.store.deepinos.org.cn/"						# main server, not recommended to use
#_mirror="https://mirrors.sdu.edu.cn/spark-store-repository"	# SDU mirror, sometimes outdated
_mirror="https://zunyun01.store.deepinos.org.cn/"
source=("${_mirror}/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
b2sums=('99dee7422a11f0bddb986aaaf0c385af0b84fb8847f1d90965f4c73006f42b44c7937bc37c6871bb93c330d0069754aebebe8c3f9a9d8c42e4a0989cf2cee6ae')

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
