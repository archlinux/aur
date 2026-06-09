# Maintainer: mfw <espadonne@outlook.com>

pkgname=aspen
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast, byte-compatible reimplementation of tree(1) in C (GNU tree 2.3.2)'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/tenseleyFlow/aspen'
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tenseleyFlow/aspen/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad10113502aa0f764b6d5ac91b58a5be92e1b3f125800f08d2224bad4997fb1e')

build() {
    cd "$pkgname-$pkgver"
    ./configure
    make release
}

check() {
    cd "$pkgname-$pkgver"
    ./aspen --version | grep -q "aspen v$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
