# Maintainer of this PKGBUILD file: mehalter <micah at mehalter.com>
# Contributor of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=write-good
pkgver=1.0.3
pkgrel=1
pkgdesc="Naive linter for English prose"
arch=('any')
url="https://github.com/btford/write-good"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('0c3e857846696947ae253bf776a46d4f0192636d667a8131adeae97bd9ad14e2')

package() {
	npm install -g \
		--user root \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$pkgname-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	install -D -m644 \
		"${srcdir}/package/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
