# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=generator-code
pkgname=nodejs-generator-code
pkgver=1.2.19
pkgrel=1
pkgdesc="Visual Studio Code extension generator"
arch=('any')
url="https://github.com/Microsoft/vscode-generator-code"
license=('MIT')
depends=('nodejs-yeoman')
makedepends=('npm')
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('e9879b3cd328d7fb89ef9f4c5f6f226f2ce73a1de001e39ef9e373b5403b71c8')

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
		"${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
