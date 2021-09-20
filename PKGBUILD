# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server
pkgver=0.7.0
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
sha256sums=('71e2cd204e23dd692d05413529d94e7bf779cf330b7e335b390e4eb815c62fd8')
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
