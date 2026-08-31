pkgname=hyprwall-git
pkgver=0.7.0
pkgrel=1
pkgdesc="GUI менеджер обоев для Hyprland с поддержкой видео"
arch=('x86_64')
url="https://github.com/Rainkord/HyprWall"
license=('MIT')
depends=('qt6-base' 'hyprpaper' 'swww' 'wayland')
optdepends=('mpvpaper: video wallpaper support'
            'papirus-icon-theme: icon theme support')
makedepends=('cmake' 'ninja' 'qt6-tools' 'wayland-protocols' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0 | sed 's/^v//'
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
