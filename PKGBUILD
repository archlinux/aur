# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=nodejs-neovim
_npmname=neovim
pkgver=4.1.0
pkgrel=1
pkgdesc="Nvim Node.js client and plugin host"
arch=("any")
url="https://github.com/neovim/node-client"
license=("MIT")
groups=()
depends=("nodejs")
makedepends=("npm")
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('110e42610181fa18f96425948bf14a3311ffacca5e876fa36ed12fa6e8a6f26f')

package() {
	npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
	
	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
