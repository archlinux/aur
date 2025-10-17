# Maintainer: trashhpandaaaa <trashhpandaaaa@gmail.com>
pkgname=gyatt-git
pkgver=r10.c66ce1c
pkgrel=1
pkgdesc="A next-gen version control system with built-in server and planned IPFS support"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/trashhpandaaaa/gyatt"
license=('MIT')
depends=('zlib')
makedepends=('git' 'gcc' 'make')
provides=('gyatt')
conflicts=('gyatt')
source=("git+https://github.com/trashhpandaaaa/gyatt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gyatt"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/gyatt"
    make clean
    make
}

check() {
    cd "$srcdir/gyatt"
    # Basic sanity check
    ./bin/gyatt --help > /dev/null
}

package() {
    cd "$srcdir/gyatt"
    
    # Install binary
    install -Dm755 "bin/gyatt" "$pkgdir/usr/bin/gyatt"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 ROADMAP.md "$pkgdir/usr/share/doc/$pkgname/ROADMAP.md"
    
    # Install license when available
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
