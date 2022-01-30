# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.8.0
pkgrel=1
pkgdesc='Language server for Dockerfiles'
arch=('any')
url='https://github.com/rcjsuen/dockerfile-language-server-nodejs'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
replaces=('dockerfile-language-server-bin' 'nodejs-dockerfile-language-server-nodejs')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('ca30af8d69275e39adb50739815b7d8b5373dd1086b5f1aaf703ff5e33c6edae')
noextract=("$pkgname-$pkgver.tgz")

PURGE_TARGETS=('CHANGELOG.md')

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" --build-from-source "$pkgname-$pkgver.tgz"
	install -d \
		"$pkgdir/usr/share/licenses/$pkgname/" \
		"$pkgdir/usr/share/doc/$pkgname/"
	ln -s \
		"/usr/lib/node_modules/$_npmname/License.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s \
		"/usr/lib/node_modules/$_npmname/OriginalLicense.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/ORIGINAL_LICENSE"
	ln -s \
		"/usr/lib/node_modules/$_npmname/README.md" \
		"$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
