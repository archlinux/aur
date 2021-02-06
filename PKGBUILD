# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: Dino Morelli <dino@ui3.info>

pkgname=hlint-static-git
pkgver=3.2.7.r19.g3d3c82c6
pkgrel=1
pkgdesc='Haskell source code suggestions'
arch=('x86_64')
url="https://github.com/ndmitchell/hlint"
license=('BSD')
depends=('git' 'stack' 'gmp')
provides=('hlint')
conflicts=('hlint' 'hlint-bin')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "$pkgname"

    stack test
}

build() {
    cd "$pkgname"

    stack setup
    stack build \
        --install-ghc \
        --ghc-options='-fdiagnostics-color=always' \
        --fast
}

package() {
    cd "$srcdir/$pkgname"
    stack install --local-bin-path "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
