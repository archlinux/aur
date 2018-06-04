# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=sit
pkgver=0.4.0
pkgrel=1
pkgdesc="Serverless (offline-first, merge-friendly) Information Tracker"
arch=('x86_64')
depends=('gcc-libs' 'zlib')
url="https://sit.fyi"
license=('MIT')
makedepends=('rust' 'cmake')
source=("https://github.com/sit-fyi/sit/archive/v$pkgver.tar.gz")
sha256sums=('8439637a175aea5303650355f7ce2fb44b2a6b9ce92e68a0887fbb680f1b4a36')

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
