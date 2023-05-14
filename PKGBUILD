# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron
_repo=https://github.com/ajbura/cinny
pkgname=(cinny-web)
pkgbase=cinny
pkgver=2.2.6
_commit=f6694031a1581af171ffe1658138dfcf344d6c6c # tag/v2.2.6
pkgrel=1
pkgdesc='Yet another matrix client — '
arch=(any)
url=https://cinny.in
license=(MIT)
depends=()
makedepends=(npm git)
source=("$pkgbase-web::git+$_repo.git#commit=$_commit")
sha512sums=('SKIP')

build() {
	cd "$pkgbase-web"
	npm install --legacy-peer-deps
	npm run build
}

package_cinny-web() {
	pkgdesc+='web version'
	backup=('etc/webapps/cinny/config.json')

	cd "$pkgbase-web"
	install -d "$pkgdir/usr/share/webapps/$pkgbase"
	cp -r dist/* "$pkgdir/usr/share/webapps/$pkgbase"
	install -d "$pkgdir/etc/webapps/$pkgbase"
	ln -s "$(realpath -m --relative-to="/etc/webapps/$pkgbase" "/usr/share/webapps/$pkgbase/config.json")" \
		"$pkgdir/etc/webapps/$pkgbase/config.json"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
