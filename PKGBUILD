pkgname=easygamma-git
pkgver=r4.d17fad4
pkgrel=1
pkgdesc="Simple GTK3 GUI for gamma and brightness control on X11 and Wayland"
arch=('x86_64')
url="https://github.com/jahamars/easygamma"
license=('MIT')
depends=('gtkmm3' 'wayland' 'libayatana-appindicator')
makedepends=('gcc' 'pkgconf' 'cmake' 'wayland-protocols' 'git')
optdepends=('xorg-xrandr: X11 gamma control')
provides=('easygamma')
conflicts=('easygamma')
source=("$pkgname::git+https://github.com/jahamars/easygamma.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$pkgname" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
