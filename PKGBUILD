# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=nodejs-neovim
_npmname=neovim
pkgver=4.4.0
pkgrel=1
pkgdesc="Nvim Node.js client and plugin host"
arch=("any")
url="https://github.com/neovim/node-client"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('2c8c8cce8e0a8aea6f855722f145fc2e5510cf7f52b16f9041e13152c71bb90b')

package() {
	npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
