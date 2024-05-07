# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
pkgname=com.qq.weixin.spark
pkgver=3.9.10deepin1
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
	'deepin-wine8-stable'
	# 'deepin-wine-helper'
	'spark-dwine-helper'
	# 'wine'
	'xdg-utils'
)
optdepends=(
	'wqy-microhei: Recommended font'
	'wqy-zenhei: Recommended font'
)
conflicts=('com.qq.weixin.dcs')
replaces=('com.qq.weixin.dcs')
# install=wechat.install
_mirror="https://cdn.d.store.deepinos.org.cn"
# _mirror="https://mirrors.sdu.edu.cn/spark-store-repository"		# SDU mirror, sometimes outdated
source=("${_mirror}/store/chat/${pkgname}/${pkgname}_${pkgver}_${_arch}.deb")
b2sums=('63813b575b99fd9464009f62143e842af948891bba02f72dfef94a05780a865cba6b70fb3b8289f0ac23f29424dd3d7da5680f91dd93b5f8131a34b228a1492b')

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
