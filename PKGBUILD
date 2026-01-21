# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hys
pkgver=0.1.2
pkgrel=3
pkgdesc='Terminal RSS Reader for Digital Minimalists in Zig.'
url='https://github.com/superstarryeyes/hys'
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
makedepends=('zig')
provides=('hys')
conflicts=('hys-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgname_$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc")
sha256sums=('38340bf3bd5392b0944b23114719f7d5bf1420a0dcdab05e41c190aaa8a62bf4'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 zig-out/bin/hys "$pkgdir/usr/bin/hys"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
