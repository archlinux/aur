# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=speccy
pkgver=0.10.1
pkgrel=1
pkgdesc="A handy toolkit for OpenAPI, with a linter to enforce quality rules, documentation rendering, and resolution"
arch=('any')
url="http://speccy.io/"
license=('MIT')
depends=('nodejs>=8.4.0')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
md5sums=('466f889f22e259c54dbb2656df8f6919')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" --only=prod $pkgname@$pkgver
	find "$pkgdir"/usr -type d -exec chmod 755 {} +
	install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_npmdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	rm -rf "$pkgdir/usr/etc" "$_npmdir/$pkgname/LICENSE" "$_npmdir/$pkgname/"*.md "$_npmdir/$pkgname/docs" "$_npmdir/$pkgname/examples" "$_npmdir/$pkgname/test" "$_npmdir/$pkgname/Dockerfile" "$_npmdir/$pkgname/.eslintrc.json" "$_npmdir/$pkgname/.dockerignore" "$_npmdir/$pkgname/.editorconfig" "$_npmdir/$pkgname/.circleci" "$_npmdir/$pkgname/.github"
}
