# Maintainer: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.0.16
pkgrel=1
pkgdesc="Auto-generate meaningful commits in a second"
arch=("x86_64")
url="https://github.com/di-sukharev/opencommit"
license=('MIT')
depends=('nodejs')
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('874c928b95209e5652c10d82e493f591a39a5c5f22068742ab2bae8f5bb85c3c')

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
    
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


