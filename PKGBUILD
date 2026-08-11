# Maintainer: Krzysztof Demir Kuźniak [krzysztofdemirkuzniak@gmail.com](mailto:krzysztofdemirkuzniak@gmail.com)

pkgname=chain-lang-git
pkgver=0.5.1.r0
pkgrel=1
pkgdesc="Chain programming language interpreter (latest git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nebania/chain-lang"
license=('MIT')

depends=('gcc-libs' 'raylib')
makedepends=('git' 'gcc' 'make')

provides=('chain-lang' 'link-lang')
conflicts=('chain-lang' 'chain-lang-bin' 'link-lang' 'link-lang-git' 'link-lang-bin')

source=("git+https://github.com/Nebania/chain-lang.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/chain-lang"

    printf '%s.r%s\n' "0.5.1" "$(git rev-list --count HEAD)"
}

build() {
    cd "$srcdir/chain-lang"

    make release
}

package() {
    cd "$srcdir/chain-lang"

    # Main executable

    install -Dm755 chainlang "$pkgdir/usr/bin/chainlang"

    # Command aliases

    ln -s chainlang "$pkgdir/usr/bin/chain"
    ln -s chainlang "$pkgdir/usr/bin/linklang"

    # License

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
