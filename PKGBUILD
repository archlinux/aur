# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=foy
pkgver=0.2.16
pkgrel=1
pkgdesc="Simple, lightweight and modern task runner for general purpose"
arch=('any')
url='http://zaaack.github.io/foy'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('9ec241fce313db9d59362e01f29b018280b30215d466655af4a3f4d652f38d30')

PURGE_TARGETS=("usr/lib/node_modules/$pkgname/*/**/*.md" 'CHANGELOG*' '.npmignore')

package() {
	export NODE_ENV=production
	npm install -g --cache-dir=npm-cache --prefix="$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d $pkgdir/usr/share/{licenses,doc}/$pkgname
	ln -s "/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
