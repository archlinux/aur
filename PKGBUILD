# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.7.3
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
sha256sums=('66235a848feeee20e7e9e391e749f3ef38d0b12ef3f7c046ccdb73d664e5d9e2')
noextract=("$pkgname-$pkgver.tgz")

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" --build-from-source "$pkgname-$pkgver.tgz"
	install -d "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"
	ln -s "/usr/lib/node_modules/$_npmname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/$_npmname/OriginalLicense.txt" "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/$_npmname/README.md" "$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
