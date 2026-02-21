pkgname=hostman
pkgver=1.2.3
pkgrel=3
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/keircn/hostman"
license=('MIT')
depends=('curl' 'sqlite' 'openssl' 'cjson')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keircn/hostman/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23f72d88308fad5ff69b95680062e28aa16bd2c18a2b5de5e61d942357d53362')

build() {
    cd "$pkgname-$pkgver" || exit
    cmake -B build -DHOSTMAN_USE_TUI=ON -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver" || exit

    install -Dm755 build/hostman "$pkgdir/usr/bin/hostman"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
