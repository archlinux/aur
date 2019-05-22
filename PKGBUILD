# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
pkgname=nginx-h5bp-server-configs
_pkgname=server-configs-nginx
pkgver=3.1.0
pkgrel=1
pkgdesc="Nginx HTTP server boilerplate configs"
arch=('any')
url="https://github.com/h5bp/server-configs-nginx"
license=('MIT')
depends=('nginx')
provides=("$pkgname")
install='.install'
source=("https://github.com/h5bp/$_pkgname/archive/$pkgver.tar.gz")
sha1sums=('c611f5c717114c461f2d08b3bf9de47f590cb8cf')

prepare() {
	cd "$_pkgname-$pkgver"
	
	sed -i -e 's|mime.types|h5bp/mime.types|g' 'h5bp/media_types/media_types.conf'
}

package() {
	cd "$_pkgname-$pkgver"
	install -d "$pkgdir/etc/nginx/"
	install -d "$pkgdir/etc/nginx/conf.d"
	install -d "$pkgdir/etc/nginx/sites-available"
	install -d "$pkgdir/etc/nginx/sites-enabled"
	install -Dm644 conf.d/.default.conf "$pkgdir/etc/nginx/sites-available/"
	install -Dm644 conf.d/no-ssl.default.conf "$pkgdir/etc/nginx/sites-available/"
	mv h5bp "$pkgdir/etc/nginx/"
	install -Dm644 mime.types "$pkgdir/etc/nginx/h5bp/mime.types"
	install -Dm644 nginx.conf "$pkgdir/etc/nginx/nginx.conf.example"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
