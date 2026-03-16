pkgname=swordfish-git
pkgver=r51.42acca7
pkgrel=1
pkgdesc="A pkill-like CLI tool with more control over process management."
arch=('x86_64')
url="https://github.com/Foox-dev/swordfish"
license=('MIT')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('swordfish')
conflicts=('swordfish')
source=("git+$url")
md5sums=('SKIP')
options=(!debug strip)
pkgver() {
    cd "$srcdir/swordfish"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
build() {
    cd "$srcdir/swordfish"
    make rel
}
package() {
    cd "$srcdir/swordfish"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/swordfish.1 "$pkgdir/usr/share/man/man1/swordfish.1"
}
