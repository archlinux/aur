# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=puppeteer
pkgname=($pkgbase{,-core}) #,-chromium,-firefox})
pkgver=24.31.0
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
sha256sums=('aa9b2e2c1978e102b062cf9a524cf0c018c951a2ecabdcacd47fe6b912fe6d7d'
            'cd77b060f921f783672b34f5f52ebce9116c744bff968532aeb702a5cd64d02e')

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
