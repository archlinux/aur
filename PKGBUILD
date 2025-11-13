# Maintainer: aasb13 <as_above_so_below31@proton.me>

pkgname=vecpaper-git
pkgver=0.0.r9560ad4
pkgrel=1
pkgdesc="Lightweight, high-performance live shader wallpaper renderer for Wayland"
arch=('x86_64')
url="https://github.com/aasb13/vecpaper"
license=('GPL-3.0-or-later')
depends=('libjpeg-turbo' 'mesa' 'wayland')
makedepends=('meson' 'ninja' 'git')
source=("git+https://github.com/aasb13/vecpaper.git")
sha256sums=('SKIP')  # Use SKIP for git sources

pkgver() {
    cd "$srcdir/vecpaper"
    printf "0.0.r%s" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/vecpaper"
    meson setup build --prefix=/usr
    ninja -C build
}

package() {
    cd "$srcdir/vecpaper"
    meson install -C build --destdir="$pkgdir"
}
