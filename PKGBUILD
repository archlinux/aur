# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tea <icepie.dev@gmail.com>

pkgname=tarojs-cli
pkgver=3.3.19
pkgrel=2
pkgdesc='Standard tooling for tarojs development'
arch=('any')
url='https://github.com/nervjs/taro'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@tarojs/cli/-/cli-$pkgver.tgz")
noextract=("${source[@]%%::*}")
sha256sums=('5d09bebd36001e1c8eefabd633ef8db62c06e8682ac5681cab2efadad6c1763d')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/@tarojs/cli/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	# fix permissions for taro templates (not grace)
	# chmod -R 777 "$pkgdir/usr/lib/node_modules/$_npmid/templates"
}
