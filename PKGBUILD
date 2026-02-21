pkgname=hostman
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/keircn/hostman"
license=('MIT')
depends=('curl' 'sqlite' 'openssl' 'cjson')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-linux-$arch.tar.gz")
sha256sums=('0d5ff88625c98770101228aa94b89e5b450e97c1c91432abd61ad56bdafeed4f')

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
