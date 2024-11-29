# Maintainer: Nicholas Bors-Sterian <fami_fish@proton.me>
pkgname='zooc-git'
pkgver=r13.7d03add
pkgrel=1
pkgdesc="A C re-write of tsoding's boomer with some added features."
arch=('x86_64')
url="https://github.com/fami-fish/zooc"
license=('MIT')

makedepends=('git' 'make' 'gcc')
depends=(
    'glibc'
    'glew'
    'mesa'
    'libx11'
    'libxrandr'
    'libxext'
)

source=("zooc::git+https://github.com/fami-fish/zooc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}
