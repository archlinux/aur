# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.0.0
pkgrel=5
pkgdesc='Screen lock program for X like in The Matrix (1999)'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/matlock"
license=('MIT')
depends=('libxext' 'libxrandr')
makedepends=('make' 'git')
source=("https://github.com/sujaltv/matlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6aebb88e9b0abc763cc4540ed54a4eef947666c5e9bcc6bfedab1a35d9196a2b')

build() {
    cd $pkgname-${pkgver}
    make build
}

package() {
    local tag=$pkgname-v$pkgver-$pkgrel-$arch
    local archive=$TMPDIR/$tag.tar.gz
    tar xzf $archive
    rm $archive

    install -D -m 4755 -o root -g root $tag/matlock "$pkgdir/usr/bin/matlock"
    install -D -m 644 $tag/LICENCE "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
    install -D -m 644 $tag/README.md "$pkgdir/usr/share/licenses/${pkgname}/README.md"
    install -D -m 644 $tag/matlock.1.gz "$pkgdir/usr/share/man/man1/matlock.1.gz"

    rm -rf $tag
}
