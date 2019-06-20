# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=pnpm
pkgver=3.5.2
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=('any')
url="https://pnpm.js.org/"
license=('MIT')
depends=('nodejs>=8.15.0')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
md5sums=('e4151da0ab9cedf0b2fc13a2dd6efc27')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" --only=prod $pkgname@$pkgver
	find "$pkgdir"/usr -type d -exec chmod 755 {} +
        find "$pkgdir"/usr/lib -depth -name '*.map' -delete
	install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_npmdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	rm -rf "$pkgdir/usr/etc" "$_npmdir/$pkgname/LICENSE" "$_npmdir/$pkgname/README.md"
}
