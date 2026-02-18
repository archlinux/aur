# Maintainer: Farhan <farhanx2983@proton.me>
pkgname=hyprwatch
pkgver=0.0.1
pkgrel=1
pkgdesc="A lightweight time tracking daemon and TUI client for Hyprland window manager"
arch=('x86_64' 'aarch64')
url="https://github.com/Farhan291/hyprwatch"
license=('Apache-2.0')
depends=('ncurses' 'hyprland')
makedepends=('cmake' 'gcc' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
