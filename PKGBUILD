# Maintainer: valletrg <https://github.com/valletrg>
pkgname=cx-search
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast trigram-indexed code search engine designed for use as a Claude subagent"
arch=('x86_64')
url="https://github.com/valletrg/cx"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'ninja' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5917aa7459aa812745382e2ce869cd98daf089a66af7692978eed3fbc75554e2')

build() {
    cd "$srcdir/cx-$pkgver"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/cx-$pkgver"
    install -Dm755 build/cx "$pkgdir/usr/bin/cx"
    install -Dm755 cx-init "$pkgdir/usr/bin/cx-init"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 cx.md "$pkgdir/usr/share/doc/$pkgname/cx.md"
}
