# Maintainer: xmengnet <794508986@qq.com>
pkgname=aria2-config-script
pkgver=0.3
pkgrel=1
pkgdesc="一个自动配置Aria2的脚本，自动创建、启动服务，可直接搭配浏览器插件使用。"
arch=(any)
license=('GPL')
depends=('aria2')

source=("aria2.conf"
	"aria2.session"
	"aria2c.service")
md5sums=('3a0439d1a807938c789e4415c38a833b'
         'SKIP'
         '4eb906a2e99a6920571d263f05433a73')
package() {
	
	user="${HOME}"
	file=${pkgdir}/etc/aria2/
	service=${pkgdir}/etc/systemd/system/
	sed -i "s#root#${user}#g" ${srcdir}/aria2.conf
	#开始安装
	if [ ! -d "$file" ]; then
		mkdir -p $file
	fi
	if [ ! -d "$service" ]; then
		mkdir -p $service
	fi
	install -Dm644 "${srcdir}"/aria2.conf "$file"
	install -Dm644 "${srcdir}"/aria2.session "$file"
	install -Dm644 "${srcdir}"/aria2c.service "$service"
	
   	echo "	********请自行修改/etc/aria2/aria2.conf 里面的下载位置"
	echo "	********然后使用 ‘sudo systemctl enable --now aria2c’ 设置开机自启并且现在启动"
	
}
