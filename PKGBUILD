# Maintainer: Ziad Strawberry <ziadstr@users.noreply.github.com>
pkgname=nashmic-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="The first Franco-Arab programming language — transpiles to C"
arch=('x86_64' 'aarch64')
url="https://github.com/Ziadstr/nashmic"
license=('MIT')
depends=('glibc' 'readline')
makedepends=('git' 'gcc')
provides=('nashmic')
conflicts=('nashmic')
source=("git+https://github.com/Ziadstr/nashmic.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/nashmic"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/nashmic"
    make CC=gcc PREFIX=/usr
}

package() {
    cd "$srcdir/nashmic"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
