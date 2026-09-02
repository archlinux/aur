# Maintainer: nebiki <alexandriagustaf@gmail.com>
pkgname=cbzview-git
pkgver=r7.9631883
pkgrel=1
pkgdesc="A fast Linux CBZ comic & manga viewer with mmap, PBO streaming, and bicubic screentone anti-aliasing"
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
makedepends=('git' 'pkgconf')
provides=('cbzview')
conflicts=('cbzview')
source=("git+https://github.com/alexantSWE/cbzview.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
