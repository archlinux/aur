# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=stacktile
pkgver=1.0.0
pkgrel=3
pkgdesc="Layout generator for the river Wayland compositor"
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/stacktile"
license=('GPL3')
makedepends=('git' 'wayland')
source=("git+${url}#tag=v${pkgver}"
        "fix-compilation.patch")
sha256sums=('e384123c11092e5567c486981788df1fe3b3bbe5bf4645d181009cf3cd3738b9'
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
