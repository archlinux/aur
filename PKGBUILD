# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=stacktile
pkgver=1.0.0
pkgrel=2
pkgdesc="Layout generator for the river Wayland compositor"
arch=('x86_64')
url="https://sr.ht/~leon_plickat/stacktile/"
license=('GPL3')
makedepends=('git' 'wayland')
source=("git+https://git.sr.ht/~leon_plickat/stacktile#tag=v$pkgver"
        "fix-compilation.patch")
sha256sums=('SKIP'
            'ef72cde58d1b416df4acf5829b31188a8b2750c80463a6771f8555c106ac6059')

prepare() {
    cd "$pkgname"
    patch -p1 -i "$srcdir/fix-compilation.patch"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
