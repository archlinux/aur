# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=1.73.0
pkgrel=1
pkgdesc="Visual Studio Code extension manager"
arch=('any')
url="https://github.com/Microsoft/vscode-vsce"
license=('MIT')
depends=('nodejs')
makedepends=(
	'npm'
	'typescript'
)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('748e3f28097cd9208ee4e91ba46315891de739b6d9fd21e2d68dfb4d8f3e7b41')

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
