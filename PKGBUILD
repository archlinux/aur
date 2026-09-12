# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=mutscan
pkgver=1.14.1
pkgrel=1
pkgdesc="Detect and visualize target mutations by scanning FastQ files directly"
arch=('x86_64')
url="https://github.com/OpenGene/MutScan"
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'zlib')
source=("MutScan-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('29e6bb996fedd0e1bd26da9ce6517a0097abe684135753d0dc5861c02568268e')

build() {
    cd "$srcdir/MutScan-$pkgver"
    make
}

check() {
    cd "$srcdir/MutScan-$pkgver"
    # no --version flag upstream; usage banner on stdout is our smoke test
    ./mutscan 2>&1 | grep -q 'read1'
}

package() {
    cd "$srcdir/MutScan-$pkgver"
    install -Dm755 mutscan "$pkgdir/usr/bin/mutscan"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
