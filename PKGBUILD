# Maintainer: greenelephante <your-email@example.com>
pkgname=zigmate-git
pkgver=r9.95d7b9b
pkgrel=1
pkgdesc="Terminal chess game with local hot-seat and network play over SSH (written in Zig)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/greenelephante/zigmate"
license=('MIT')
makedepends=('git' 'zig')
provides=('zigmate')
conflicts=('zigmate')
source=("$pkgname::git+https://codeberg.org/greenelephante/zigmate.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname"
    install -Dm755 zig-out/bin/zigmate "$pkgdir/usr/bin/zigmate"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
