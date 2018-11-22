# Maintainer: Your Name <youremail@domain.com>

pkgname=nodejs-vmd
_npmname=vmd
pkgver=1.34.0
pkgrel=1
pkgdesc="Preview markdown files in a separate window. Markdown is formatted exactly the same as on GitHub."
arch=("any")
url="https://github.com/yoshuawuyts/vmd"
license=('MIT')
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('d53f1cc73038aa11b0fc8cba1b734272c3cfab7af92c82a1e9d71075e3aa27d3')

package() {
	npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

