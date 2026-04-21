# Maintainer: MarcusPy827 <https://github.com/MarcusPy827>

pkgname=husky-panel-git
pkgver=1.0.1
pkgrel=1
pkgdesc="A monolithic bar for Linux desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/MarcusPy827/Husky-Panel"
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-wayland'
    'qt6-declarative'
    'layer-shell-qt'
    'kservice'
    'libdbusmenu-lxqt'
    'libpulse'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
    'wayland'
    'wayland-protocols'
    'libxkbcommon'
    'git'
)
optdepends=(
    'libxcb: X11/Xorg session support'
)
provides=('husky-panel')
conflicts=('husky-panel')
source=("$pkgname::git+https://github.com/MarcusPy827/Husky-Panel.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_KWIN_PLUGIN=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
