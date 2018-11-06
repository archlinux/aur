# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=alex
pkgname=alexjs
pkgver=6.0.0
pkgrel=1
pkgdesc="Catch insensitive, inconsiderate writing"
arch=('any')
url="https://alexjs.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz)
sha256sums=('326554be5709fadbcc906a00e58b69bdd279aed48396351de3ed35ed4fa215c9')

package() {
	npm install -g \
		--user root \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$_name-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	install -D -m644 \
		"${srcdir}/package/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
