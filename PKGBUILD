# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tea <icepie.dev@gmail.com>

pkgname=tarojs-cli
pkgver=3.3.20
pkgrel=1
pkgdesc='Standard tooling for tarojs development'
arch=('any')
url='https://github.com/nervjs/taro'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@tarojs/cli/-/cli-$pkgver.tgz")
noextract=("${source[@]%%::*}")
sha256sums=('629c68e944e53aeb97a03a6db1aa0fac3314b9796da22ea7f3321496ad03eae4')

PURGE_TARGETS=('*.1')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir/"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/@tarojs/cli/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	# fix permissions for taro templates (not grace)
	# chmod -R 777 "$pkgdir/usr/lib/node_modules/$_npmid/templates"
}
