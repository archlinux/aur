# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
# Contributor: Ewout van Mansom <ewout at vanmansom dot name>

pkgname=nginx-h5bp-server-configs
_pkgname=server-configs-nginx
pkgver=5.0.0
pkgrel=1
pkgdesc="Nginx HTTP server boilerplate configs"
arch=('any')
url="https://github.com/h5bp/server-configs-nginx"
license=('MIT')
depends=('nginx')
provides=("$pkgname")
install='.install'
source=("https://github.com/h5bp/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('f637110f88a7e599eb1eb9494f9a699b1e963297161f90710c2a70e2ad483ff86601b274139a9741c4f136d2dfb9966991891b2358777c8eeabcba1201622545')

prepare() {
	cd "$_pkgname-$pkgver"

	sed -i -e 's|^pid|#&|g' 'nginx.conf'
	sed -i -e 's|www-data|http|g' 'nginx.conf'
	sed -i -e 's|mime.types|h5bp/mime.types|g' 'h5bp/media_types/media_types.conf'
}

package() {
	cd "$_pkgname-$pkgver"
	install -d "$pkgdir/etc/nginx/"
	install -d "$pkgdir/etc/nginx/conf.d"
	install -Dm644 conf.d/.default.conf "$pkgdir/etc/nginx/conf.d/default.conf"
	install -Dm644 conf.d/no-ssl.default.conf "$pkgdir/etc/nginx/conf.d/no-ssl.default.conf"
	install -d "$pkgdir/etc/nginx/conf.d/templates"
	install -Dm644 conf.d/templates/example.com.conf "$pkgdir/etc/nginx/conf.d/templates/example.com.conf"
	install -Dm644 conf.d/templates/no-ssl.example.com.conf "$pkgdir/etc/nginx/conf.d/templates/no-ssl.example.com.conf"
	mv h5bp "$pkgdir/etc/nginx/"
	install -Dm644 mime.types "$pkgdir/etc/nginx/h5bp/mime.types"
	install -Dm644 nginx.conf "$pkgdir/etc/nginx/nginx.conf.example"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
