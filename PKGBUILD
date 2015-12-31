# Maintainer: Michael Straube <michastgit@gmx.de>

pkgname=cornas-git
pkgver=r3.b1aeeb1
pkgrel=1
pkgdesc="Run shell commands if mouse pointer is moved to a screen corner."
url="https://github.com/michast/cornas"
license=('MIT')
arch=('i686' 'x86_64')
depends=('libxi')
source=("git://github.com/michast/cornas.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/cornas"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/cornas"
    make
}

package() {
    cd "$srcdir/cornas"
    install -d "$pkgdir"/usr/share/licenses/"$pkgname"
    install -m 644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
