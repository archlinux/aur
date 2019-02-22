# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=swagger2openapi
pkgver=5.2.3
pkgrel=1
pkgdesc="Convert Swagger 2.0 definitions to OpenApi 3.0 and validate"
arch=('any')
url="https://mermade.org.uk/openapi-converter"
license=('BSD')
depends=('nodejs>=8.4.0')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
md5sums=('6fd36d691c7271d77bc313db1ebcbb0a')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" --only=prod $pkgname@$pkgver
	find "$pkgdir"/usr -type d -exec chmod 755 {} +
	install -Dm644 "$_npmdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$_npmdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	rm -rf "$pkgdir/usr/etc" "$_npmdir/$pkgname/LICENSE" "$_npmdir/$pkgname/Dockerfile" "$_npmdir/$pkgname/README.md"
}
