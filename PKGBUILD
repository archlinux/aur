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

    # install -m 755 -D $tag/matlock "$pkgdir/bin/matlock"
    install -m 644 -D $tag/LICENCE "$pkgdir/share/licenses/${pkgname}/LICENCE"
    install -m 644 -D $tag/README.md "$pkgdir/share/licenses/${pkgname}/README.md"
    install -m 644 -D $tag/matlock.1.gz "$pkgdir/share/man/man1/matlock.1.gz"

    rm -rf $tag
}
