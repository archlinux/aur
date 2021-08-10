# Maintainer: Knut Ahlers <knut at ahlers dot me>
# Contributor: Andrew Steinke <rkcf@rkcf.me>

pkgname=eslint-plugin-vue
pkgver=7.15.2
pkgrel=1
pkgdesc='Official ESLint plugin for Vue.js'
arch=('any')
url='https://github.com/vuejs/eslint-plugin-vue'
license=('MIT')
depends=('eslint')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('94a9e135ed2754d2bd5b525c9a4e1fecc9d27b8351602881970c4546f402c2da')
noextract=($pkgname-$pkgver.tgz)

package() {
	install -dm 755 "$pkgdir/usr/lib"
	npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	# Remove files that conflict with `eslint`:
	rm -rf "$pkgdir/usr/lib/node_modules/eslint"
	rm -rf "$pkgdir/usr/bin"

	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
