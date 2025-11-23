#maintainer: Lennart Martens monkeynator78@gmail.com
pkgname=drinfo-git
pkgver=V.1.2.0.r1.g9b947d2
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

    # Falls Tags existieren → nutze sie
    if git describe --tags --long >/dev/null 2>&1; then
        git describe --tags --long \
        | sed 's/^v//; s/-/.r/; s/-/./'
    else
        # Fallback, wenn KEINE Tags existieren
        printf "0.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "$srcdir/drinfo"
    make
}

package() {
    cd "$srcdir/drinfo"

    install -Dm755 drinfo "$pkgdir/usr/bin/drinfo"
    install -Dm644 drinfo.1 "$pkgdir/usr/share/man/man1/drinfo.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
