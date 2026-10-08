# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=psmc
pkgver=0.6.5
pkgrel=1
pkgdesc="Implementation of the Pairwise Sequentially Markovian Coalescent model"
arch=('x86_64')
url="https://github.com/lh3/psmc"
license=('MIT')
depends=('glibc' 'perl' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0954b3e28dda4ae350bdb9ebe9eeb3afb3a6d4448cf794dac3b4fde895c3489b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    # utils/ carries the helpers the documented workflow needs (fq2psmcfa, ...)
    make -C utils
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d "$pkgdir/usr/bin"
    install -m755 psmc "$pkgdir/usr/bin/psmc"
    install -m755 utils/cntcpg utils/fq2psmcfa utils/splitfa utils/calD utils/mutDiff \
        "$pkgdir/usr/bin/"
    install -m755 utils/*.pl "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
