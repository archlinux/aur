pkgname=coreusage-git
pkgver=1.0.5.r0.g0000000
pkgrel=1
pkgdesc="Lightweight CPU core usage information tool written in C"
arch=('x86_64')
url="https://github.com/Lennart1978/coreusage"
license=('MIT')   # falls anders → anpassen
depends=('lm_sensors')
makedepends=('git' 'gcc' 'make' 'lm_sensors')
provides=('coreusage')
conflicts=('coreusage')

source=("coreusage::git+https://github.com/Lennart1978/coreusage.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/coreusage"
    git describe --long --tags 2>/dev/null | sed 's/^v//; s/-/./g'
}

build() {
    cd "$srcdir/coreusage"
    make
}

package() {
    cd "$srcdir/coreusage"

    # Binary
    install -Dm755 coreusage "$pkgdir/usr/bin/coreusage"

    # Manpage (falls vorhanden)
    if [[ -f coreusage.1 ]]; then
        install -Dm644 coreusage.1 "$pkgdir/usr/share/man/man1/coreusage.1"
    fi

    # License + README
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
