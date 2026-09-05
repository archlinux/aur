# Maintainer: nebiki <alexandriagustaf@gmail.com>
pkgname=cbzview-git
pkgver=r10.265d71f
pkgrel=1
pkgdesc="A fast, local only  Linux CBZ comic & manga viewer with mmap, PBO streaming, and bicubic screentone anti-aliasing"
arch=('x86_64' 'aarch64')
url="https://github.com/alexantSWE/cbzview"
license=('MIT')
depends=(
    'glibc'
    'glfw'
    'libzip'
    'libjpeg-turbo'
    'libwebp'
    'libpng'
    'libavif'
    'libjxl'
    'libglvnd'
    'hicolor-icon-theme'
)
makedepends=('git')
provides=('cbzview')
conflicts=('cbzview')
source=("git+https://github.com/alexantSWE/cbzview.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/cbzview"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/cbzview"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/cbzview"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
