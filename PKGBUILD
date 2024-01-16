# Maintainer: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.0.4
pkgrel=1
pkgdesc="Auto-generate impressive commits with AI in 1 second"
arch=("x86_64")
url="https://github.com/di-sukharev/opencommit"
license=('MIT')
depends=('nodejs')
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('b8e937da3dfa7366aff05b425a6c006cc0e10b77e9aec35471ed39e6554b04da')

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
    
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


