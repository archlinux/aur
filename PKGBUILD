# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=com.qq.weixin.spark
pkgver=3.7.5.11spark7
pkgrel=1
pkgdesc="Tencent WeChat Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://weixin.qq.com/"
license=('unknown')
depends=('deepin-wine5' 'deepin-wine-helper' 'xdg-utils')
makedepends=('python')
optdepends=('ttf-ms-fonts: Microsoft Core fonts (You might also need Microsoft YaHei additionally)'
	'noto-fonts-cjk: Google Noto CJK fonts')
conflicts=('com.qq.weixin.dcs')
replaces=('com.qq.weixin.dcs')
install=wechat.install
source=("http://d.store.deepinos.org.cn//store/chat/com.qq.weixin.spark/app.json"
	"http://d.store.deepinos.org.cn//store/chat/com.qq.weixin.spark/${pkgname}_${pkgver}_i386.deb")
md5sums=('SKIP'
	'SKIP')

pkgver() {
	cat app.json | sed 's/,/\n/g' | grep "Version" | sed 's/:/\n/g' | sed '1d' | sed 's/}//g' | sed 's/"//g' | python -c "s=input();print(s.strip())"
}


package() {
	cd ${pkgdir}
	#tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
	bsdtar -xpvf ${srcdir}/data.tar.xz
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
	sed -i 's/WeChat.exe/wechat.exe/' usr/share/applications/${pkgname}.desktop
	rmdir opt/apps/${pkgname}/entries/
	rm -rf usr/share/doc
	rm opt/apps/${pkgname}/info
}
