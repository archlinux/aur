# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron
_repo=https://github.com/ajbura/cinny
pkgname=(cinny-web)
pkgbase=cinny
pkgver=2.2.4
_commit=a6fb44e1abe9ad48136dee8e7d053e639f37bedc # tag/v2.2.4
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

	cd "$pkgbase-web"

	install -d "$pkgdir/usr/share/webapps/cinny"

	cp -r dist/* "$pkgdir/usr/share/webapps/cinny"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
