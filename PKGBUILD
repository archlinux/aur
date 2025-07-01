# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=puppeteer
pkgname=($pkgbase{,-core}) #,-chromium,-firefox})
pkgver=24.11.2
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
sha256sums=('76d558c9fffd23e6d5cfe7457677026320c07260c0ac9022c29f04f1f97785dc'
            '6be987ee5ff4a49df3e7778deeed48a973800654487b8f5e09648214e46ba8ea')

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
