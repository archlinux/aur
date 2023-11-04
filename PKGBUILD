
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=buongiorno-git
_pkgname=buongiorno
pkgver=0.1.1.r1.gda78f53
pkgrel=1
pkgdesc='Modal TUI greeter for greetd.'
arch=('x86_64')
url='https://sr.ht/~andreafeletto/buongiorno'
license=('GPL3')
depends=('greetd')
makedepends=('zig' 'git')
provides=('buongiorno')
conflicts=('buongiorno-git')
source=("git+https://git.sr.ht/~andreafeletto/$_pkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"
    zig build -Doptimize=ReleaseSafe -Dsystemd
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" zig build -Doptimize=ReleaseSafe -Dsystemd --prefix '/usr'
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
