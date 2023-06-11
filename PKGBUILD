# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
pkgname=com.qq.weixin.spark
pkgver=3.8.0.41spark23
pkgrel=1
pkgdesc="Tencent WeChat Client from Spark Store"
arch=('i686' 'x86_64')
url="https://weixin.qq.com/"
license=('unknown')
depends=(
	'bash'
	'hicolor-icon-theme'
	'lib32-glibc'
	'lib32-libx11'
	'lib32-libxext'
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
#_mirror="https://d.store.deepinos.org.cn"						# main server, not recommended to use
#_mirror="https://mirrors.sdu.edu.cn/spark-store-repository"	# SDU mirror, sometimes outdated
_mirror="https://zunyun01.store.deepinos.org.cn"
source=("${_mirror}/store/chat/${pkgname}/${pkgname}_${pkgver}_i386.deb")
b2sums=('0429817a8667f6a575097c354aedd6109e2309b4ec990047269f1dd662a876a9a67cb2646527b259d418d7078a00dc62713b088eecb44cb97de149b0efaf338e')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	sed -i 's/"deepin-wine6-stable"/"wine"/' opt/apps/${pkgname}/files/run.sh
	sed -i 's/WeChat.exe/wechat.exe/' usr/share/applications/${pkgname}.desktop
	rmdir opt/apps/${pkgname}/entries/
	rm opt/apps/${pkgname}/info
	chown -R root:root .
}
