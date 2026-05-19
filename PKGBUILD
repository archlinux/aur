pkgname=hostman
pkgver=1.2.5
pkgrel=1
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/keircn/hostman"
license=('MIT')
depends=('curl' 'sqlite' 'openssl' 'ncurses')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/keircn/hostman/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ada0cb0457e2e95429c57b7132017ec0675515d469c210add818169dc3ab3ab8')

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
