# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=1.59.0
pkgrel=1
pkgdesc="Visual Studio Code extension manager"
arch=('any')
url="https://github.com/Microsoft/vscode-vsce"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('cb5c8a5e4f36e06ce1ada8a774383a02e8edc7245ee0cc665b051474510bfc99')

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
