# Maintainer: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.2.2
pkgrel=1
pkgdesc="Auto-generate impressive commits with AI in 1 second"
arch=("any")
url="https://github.com/di-sukharev/opencommit"
license=('MIT')
depends=('nodejs')
makedepends=("npm")
provides=("$pkgname")
conflicts=("$pkgname")
options=('!strip')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('665ff2fc2dd5c6320a62d535b26293bbf078fc94ef638ec9cdd4c9a0b00cd220')

prepare() {
    tar -xzf "$pkgname-$pkgver.tgz"
}

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/package

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
    
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
