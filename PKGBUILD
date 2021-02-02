# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
pkgname=nginx-h5bp-server-configs
_pkgname=server-configs-nginx
pkgver=3.3.0
pkgrel=1
pkgdesc="Nginx HTTP server boilerplate configs"
arch=('any')
url="https://github.com/h5bp/server-configs-nginx"
license=('MIT')
depends=('nginx')
provides=("$pkgname")
install='.install'
source=("https://github.com/h5bp/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('de06b9317951b449f691fbbfa9f444ebaff2dfc3b4fd431ffc9d5079691bda1749f0cf8c4343228f9a146a7bda903527ea43085d822f5e8ab64476cb8da49475')

prepare() {
	cd "$_pkgname-$pkgver"
	
	sed -i -e 's|www-data|http|g' 'nginx.conf'
	sed -i -e 's|mime.types|h5bp/mime.types|g' 'h5bp/media_types/media_types.conf'
}

package() {
	cd "$_pkgname-$pkgver"
	install -d "$pkgdir/etc/nginx/"
	install -d "$pkgdir/etc/nginx/conf.d"
	install -Dm644 conf.d/.default.conf "$pkgdir/etc/nginx/conf.d/default.conf"
	install -Dm644 conf.d/no-ssl.default.conf "$pkgdir/etc/nginx/conf.d/no-ssl.default.conf"
	mv h5bp "$pkgdir/etc/nginx/"
	install -Dm644 mime.types "$pkgdir/etc/nginx/h5bp/mime.types"
	install -Dm644 nginx.conf "$pkgdir/etc/nginx/nginx.conf.example"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
