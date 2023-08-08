# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
pkgname=com.qq.weixin.spark
pkgver=3.8.0.41spark23.1
pkgrel=1
pkgdesc="Tencent WeChat Client from Spark Store"
arch=('i686' 'x86_64')
_arch=all
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
# _mirror="https://d.store.deepinos.org.cn"						# no longer provides direct download
_mirror="https://mirrors.sdu.edu.cn/spark-store-repository"		# SDU mirror, sometimes outdated
# _mirror="https://zunyun01.store.deepinos.org.cn"				# no longer provides direct download
source=("${_mirror}/store/chat/${pkgname}/${pkgname}_${pkgver}_${_arch}.deb")
b2sums=('f5b8cec8dc7c88efc423121a536cb03bbddafef058c807ffb0f8e9c2c7c0661a8c2c0539ca7d818eb05891068cc779acc3dd79c8fa3f89db56196c9dab3659d3')

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
