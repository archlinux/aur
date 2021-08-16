# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=chaos
pkgver=0.2.0
pkgrel=1
pkgdesc="A purely functional programming language that achieves zero cyclomatic complexity"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/chaos-lang/chaos"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chaos-lang/chaos/archive/v$pkgver.tar.gz")
depends=('readline')
sha256sums=('854a4c00427bcf22727b322351a126a6bfeca907c1c10b181f08f5b41ea39ab5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
    mkdir -p "$pkgdir/usr/include/chaos"
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 Chaos.h "$pkgdir/usr/include/"
    install -Dm644 parser.tab.h enums.h "$pkgdir/usr/include/chaos/"
    find utilities -type f -name "*.h" -exec install -Dm644 '{}' "$pkgdir/usr/include/chaos/{}" \;
    find lexer -type f -name "*.h" -exec install -Dm644 '{}' "$pkgdir/usr/include/chaos/{}" \;
    find parser -type f -name "*.h" -exec install -Dm644 '{}' "$pkgdir/usr/include/chaos/{}" \;
    find interpreter -type f -name "*.h" -exec install -Dm644 '{}' "$pkgdir/usr/include/chaos/{}" \;
    find compiler -type f -name "*.h" -exec install -Dm644 '{}' "$pkgdir/usr/include/chaos/{}" \;
    find ast -type f -name "*.h" -exec install -Dm644 '{}' "$pkgdir/usr/include/chaos/{}" \;
}
