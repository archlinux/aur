# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=sit
pkgver=0.4.1
pkgrel=1
pkgdesc="Serverless (offline-first, merge-friendly) Information Tracker"
arch=('x86_64')
depends=('gcc-libs' 'zlib')
url="https://sit.fyi"
license=('MIT')
makedepends=('rust' 'cmake')
source=("https://github.com/sit-fyi/sit/archive/v$pkgver.tar.gz")
sha256sums=('ff78edeaf6e1831d0063e000209aed5d9d76461c455b3e7b4f3fb1dda9117cff')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cd "target/release"
    install -Dm755 sit "$pkgdir/usr/bin/sit"
    install -Dm755 sit-web "$pkgdir/usr/bin/sit-web"
}
