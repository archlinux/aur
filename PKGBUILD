# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=sandsmark-xdg-autostart-launcher-git
pkgver=10.f5b5758
pkgrel=1
pkgdesc="Minimalistic (315 lines of code, no dependencies) XDG compliant autostart launcher"
arch=(i686 x86_64)
url="https://github.com/sandsmark/xdg-autostart-launcher"
license=(GPL3)
depends=(gcc-libs)
makedepends=(git cmake)
provides=(sandsmark-xdg-autostart-launcher xdg-autostart-launcher)
conflicts=(sandsmark-xdg-autostart-launcher xdg-autostart-launcher)
source=('git+https://github.com/sandsmark/xdg-autostart-launcher.git')
md5sums=('SKIP')

pkgver() {
    cd xdg-autostart-launcher
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
        cmake ../xdg-autostart-launcher \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
