# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=write-good
pkgver=1.0.2
pkgrel=1
pkgdesc="Naive linter for English prose"
arch=('any')
url="https://github.com/btford/write-good"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('7a69215e1fcf1f5cb376086e6e56c3e5e6113b34ccb2747157b2d84e4a53b35e')

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
