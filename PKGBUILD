# Maintainer: mehmetbayoglu <mehmetbayoglu@users.noreply.github.com>
pkgname=hyprconfig-gui-git
pkgver=r1.master
pkgrel=1
pkgdesc="C++ Dear ImGui GUI editor for Hyprland configuration files"
arch=('x86_64')
url="https://github.com/mehmetbayoglu/hyprconfig-gui"
license=('MIT')
depends=('glfw' 'mesa')
makedepends=('cmake' 'git' 'gcc')
provides=('hyprconfig-gui')
conflicts=('hyprconfig-gui')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hyprconfig-gui"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/hyprconfig-gui"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    cd "$srcdir/hyprconfig-gui"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
