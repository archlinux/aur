# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=gllvm-git
pkgver=v1.2.9.r3.g78dee16
pkgrel=1
pkgdesc="Whole Program LLVM: wllvm ported to go"
arch=('any')
url="https://github.com/SRI-CSL/gllvm"
license=('BSD')
depends=('clang' 'llvm')
makedepends=('git' 'go')
provides=('gllvm')
conflicts=('gllvm')
source=("$pkgname"::'git+https://github.com/SRI-CSL/gllvm.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    export GOPATH="$pkgdir/usr"
    go get github.com/SRI-CSL/gllvm/cmd/...
    rm -rf "$pkgdir/usr/src"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set sw=4 ts=4 et:
