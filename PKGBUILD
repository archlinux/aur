# Maintainer of this PKGBUILD file: mehalter <micah at mehalter.com>
# Contributor of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=write-good
pkgver=1.0.8
pkgrel=2
pkgdesc="Naive linter for English prose"
arch=('any')
url="https://github.com/btford/write-good"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('f54db3db8db0076fd1c05411c7f3923f055176632c51dc4046ab216e51130221')

package() {
	npm install -g \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$pkgname-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	install -D -m644 \
		"${srcdir}/package/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
