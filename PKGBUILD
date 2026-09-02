# Maintainer: nebiki <alexandriagustaf@gmail.com>
pkgname=cbzview-git
pkgver=r3.7f6fe0e
pkgrel=1
pkgdesc="fast Linux CBZ comic & manga viewer with mmap, PBO streaming, and bicubic screentone anti-aliasing"
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
    'libglvnd'
    'hicolor-icon-theme'
)
makedepends=('git' 'gcc' 'pkgconf' 'make')
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
    make -j$(nproc)
}

package() {
    cd "$srcdir/cbzview"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
