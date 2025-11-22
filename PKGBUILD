pkgname=drinfo-git
pkgver=1.2.0.r0.g0000000
pkgrel=1
pkgdesc="Linux system information tool written in C"
arch=('x86_64')
url="https://github.com/Lennart1978/drinfo"
license=('MIT')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('drinfo')
conflicts=('drinfo')

source=("drinfo::git+https://github.com/Lennart1978/drinfo.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/drinfo"
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/-/./g'
}

build() {
    cd "$srcdir/drinfo"
    make
}

package() {
    cd "$srcdir/drinfo"

    # Binary
    install -Dm755 drinfo "$pkgdir/usr/bin/drinfo"

    # Manpage
    install -Dm644 drinfo.1 "$pkgdir/usr/share/man/man1/drinfo.1"

    # Lizenz und Doku
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
