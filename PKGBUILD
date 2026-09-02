# Maintainer: Rainkord
pkgname=wallcraft-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Graphical wallpaper manager for Hyprland with lock screen sync and slideshow"
arch=('x86_64')
url="https://github.com/Rainkord/WallCraft"
license=('MIT')
depends=('qt6-base' 'hyprpaper' 'mpvpaper' 'swww')
optdepends=('papirus-icon-theme: icon theme support')
makedepends=('cmake' 'ninja' 'qt6-tools' 'wayland-protocols')
provides=('wallcraft')
conflicts=('wallcraft' 'hyprwall' 'hyprwall-git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
