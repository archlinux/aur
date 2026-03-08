# Maintainer: cacarico <https://github.com/cacarico>
pkgname=hyprlua-git
pkgver=0.0.1.r0.g2a9022b
pkgrel=1
pkgdesc="Lua 5.4 scripting support for Hyprland via hyprland.lua config"
arch=('x86_64')
url="https://github.com/cacarico/hyprlua"
license=('MIT')
depends=('hyprland' 'lua54' 'pixman')
makedepends=('cmake' 'pkgconf' 'git')
provides=('hyprlua')
conflicts=('hyprlua')
source=("$pkgname::git+https://github.com/cacarico/hyprlua.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
