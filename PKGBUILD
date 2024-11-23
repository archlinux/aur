# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=picgo
pkgname=picgo-core
pkgver=1.5.7
pkgrel=1
pkgdesc="A tool to upload images by CLI"
arch=('any')
url="https://picgo.github.io/PicGo-Core-Doc/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=(picgo)
conflicts=(picgo)
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('2b17454204daaaac71e8439132475572e79462565dd0f26cc9279f2ec778c79c')

package() {
	npm install -g \
		--user root \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$_name-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	rm -rf "$pkgdir/usr/lib/node_modules/root"
}
