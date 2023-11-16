# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Henrik Laxhuber <henrik at laxhuber dot com>

_pkgname=texlab
pkgname=$_pkgname-git
pkgver=r1267.8ae99ec
pkgrel=3
pkgdesc='An implementation of the Language Server Protocol for LaTeX'
arch=(any)
url=https://github.com/latex-lsp/texlab
license=(MIT)

conflicts=($_pkgname $_pkgname-bin)
makedepends=(git cargo)
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir"/$_pkgname
    printf r%s.%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build () {
    cd "$srcdir"/$_pkgname
    cargo +stable build --release --locked
}

check() {
    cd "$srcdir"/$_pkgname
    cargo +stable test --release --all --locked
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm 755 target/release/$_pkgname "$pkgdir"/usr/bin/$_pkgname
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
