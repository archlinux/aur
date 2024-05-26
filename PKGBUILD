# Maintainer: Kimiblock Moe

pkgname=(cinny-web)
pkgbase=cinny
pkgver=3.2.0
pkgrel=1
pkgdesc='Yet another matrix client — web version'
arch=(any)
license=(AGPL-3.0-or-later)
depends=(nodejs-vite)
url=https://github.com/cinnyapp/cinny
makedepends=(npm git yarn)
source=("git+https://github.com/cinnyapp/cinny#tag=v${pkgver}")
sha512sums=('SKIP')

function prepare() {
	NODE_OPTIONS="--max_old_space_size=4096"
	cd "cinny"
	yarn
}

build() {
	cd "cinny"
	NODE_OPTIONS="--max_old_space_size=4096"
	#npm install --legacy-peer-deps
	#yarn dist
	yarn run build
}

package_cinny-web() {
	url=https://github.com/cinnyapp/cinny
	NODE_OPTIONS="--max_old_space_size=4096"
	backup=('etc/webapps/cinny/config.json')
	cd "cinny"
	install -d "$pkgdir/usr/share/webapps/$pkgbase"
	cp -r dist/* "$pkgdir/usr/share/webapps/$pkgbase"
	install -d "$pkgdir/etc/webapps/$pkgbase"
	mv "${pkgdir}/usr/share/webapps/$pkgbase/config.json" \
		"${pkgdir}/etc/webapps/$pkgbase/config.json"
	ln -sfr "${pkgdir}/etc/webapps/$pkgbase/config.json" \
		"${pkgdir}/usr/share/webapps/$pkgbase/config.json"
	#install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
