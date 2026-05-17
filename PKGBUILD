# Maintainer: jadrens <jadrens@example.com>
pkgname=headtail-git
pkgver=1.1.0.r0.g2eebb8e
pkgrel=1
pkgdesc="A combined head and tail utility - print the first and last N lines of a file (git version)"
arch=('x86_64')
url="https://github.com/jadrens/headtail"
license=('MIT')
depends=()
makedepends=('cmake' 'gcc' 'git')
provides=("headtail")
conflicts=("headtail")


source=("$pkgname::git+$url.git#branch=main")


sha256sums=('SKIP')




pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^[vV]//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 build/headtail "$pkgdir/usr/bin/headtail"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
