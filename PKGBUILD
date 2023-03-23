# Maintainer: Cooper Pierce <cppierce@andrew.cmu.edu>
pkgname=smlfmt
pkgver=1.0.0
pkgrel=1
pkgdesc="An auto-formatter for Standard ML "
url="https://github.com/shwestrick/smlfmt"
arch=('x86_64')
license=(MIT)
makedepends=('mlton')
source=("$pkgname-$pkgver.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('0c575c98db4a434eaddb10dd3d813f75')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "smlfmt" "$pkgdir/usr/bin/smlfmt"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
    cd "$pkgname-$pkgver"
    # Test case runner relies on finding the git root
    git init
    cd test
    ./runall
}
