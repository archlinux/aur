# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=genefuse
pkgver=0.8.0
pkgrel=1
pkgdesc="Gene fusion detection and visualization from raw FastQ files"
arch=('x86_64')
url="https://github.com/OpenGene/GeneFuse"
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'zlib')
source=("GeneFuse-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c6da54a885d8c1a8be3a64dd3c8d6ea31a03b7c6e54df23950664541624c5377')

build() {
    cd "$srcdir/GeneFuse-$pkgver"
    make
}

check() {
    cd "$srcdir/GeneFuse-$pkgver"
    # no --version flag upstream; usage banner on stdout is our smoke test
    ./genefuse 2>&1 | grep -q 'read1'
}

package() {
    cd "$srcdir/GeneFuse-$pkgver"
    install -Dm755 genefuse "$pkgdir/usr/bin/genefuse"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
