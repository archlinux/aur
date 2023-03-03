# Maintainer: xmengnet <my@liyp.cc>
pkgname=aria2-config-script
pkgver=0.5
pkgrel=2
pkgdesc="一个自动配置Aria2的脚本，自动创建、启动服务，可直接搭配浏览器插件使用。"
arch=(any)
license=('GPL')
depends=('aria2')

source=("aria2.conf"
	"aria2.session"
	"aria2c.service"
	"aria2c@.service"
	"usage.install")
md5sums=('3a0439d1a807938c789e4415c38a833b'
         'SKIP'
         '4eb906a2e99a6920571d263f05433a73'
         '3fe49c8d556f6669882130f5448c8b32'
         'SKIP')
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
	install -Dm644 "${srcdir}"/aria2c@.service "$service"

	install=usage.install

	
}
