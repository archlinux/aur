pkgname=hyprwall-git
pkgver=r41.0227305
pkgrel=1
pkgdesc="Wallpaper manager for Hyprland"
arch=('x86_64')
url="https://github.com/Rainkord/HyprWall"
license=('MIT')
depends=('qt6-base' 'wayland' 'hyprpaper')
optdepends=('mpvpaper: video wallpaper support')
makedepends=('cmake' 'git')
provides=('hyprwall')
conflicts=('hyprwall')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
