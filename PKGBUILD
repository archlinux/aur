# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=puppeteer
pkgname=($pkgbase{,-core}) #,-chromium,-firefox})
pkgver=24.17.1
pkgrel=1
pkgdesc='JavaScript API for Chrome and Firefox'
arch=(any)
url=https://pptr.dev
license=(Apache-2.0)
depends=(nodejs)
makedepends=(npm)
_archive1="$pkgbase-$pkgver"
_archive2="$pkgbase-core-$pkgver"
source=("https://registry.npmjs.org/$pkgbase/-/$_archive1.tgz"
        "https://registry.npmjs.org/$pkgbase-core/-/$_archive2.tgz")
noextract=("$_archive.tgz")
sha256sums=('a24c67ff5f126d1093aa4dead94f05ea08d5624b0ab424cf77e6fcd0b77825e2'
            '4a9e76d6b94920eb97b2f39c9428a05e0a1176603e9a41a20c7ee4f260b03b90')

_npm_i() {
	npm install --no-audit --no-fund -g --prefix "$pkgdir/usr" "$1.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	chown -R root:root "$pkgdir"
}

package_puppeteer() {
	depends+=("$pkgname-core=$pkgver")
	_npm_i "$_archive1"
	rm -rf "$pkgdir/usr/lib/node_modules/$pkgname/node_modules/$pkgname-core"
}

package_puppeteer-core() {
	optdepends=('chromium: for use with Chrome'
	            'firefox: for use with Firefox')
	_npm_i "$_archive2"
}

package_puppeteer-chromium() {
	depends+=("$pkgbase=$pkgver" chromium)
}

package_puppeteer-firefox() {
	depends+=("$pkgbase=$pkgver" firefox)
}
