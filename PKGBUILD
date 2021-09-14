# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=gllvm-git
pkgver=1.3.001.r20.g938e851
pkgrel=1
pkgdesc="Whole Program LLVM: wllvm ported to go"
arch=('any')
url="https://github.com/SRI-CSL/gllvm"
license=('BSD')
depends=()
makedepends=('git' 'go')
optdepends=('clang: backend LLVM compiler')
provides=('gllvm')
conflicts=('gllvm')
source=("$pkgname"::'git+https://github.com/SRI-CSL/gllvm')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

package() {
    cd "$srcdir/$pkgname"
    export GOPATH="$pkgdir/usr"
    go get github.com/SRI-CSL/gllvm/cmd/...
    rm -rf "$pkgdir/usr/src"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set sw=4 ts=4 et:
