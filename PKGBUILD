# Maintainer: Syvarinth <syvarinth@gmail.com>
pkgname=pacman-gui
pkgver=1.3.1
pkgrel=1
pkgdesc="Simple GTK4 GUI for pacman package manager with AUR support"
arch=('x86_64')
url="https://github.com/Coneriys/pacman-gui"
license=('GPL3')
depends=('gtk4' 'glib2' 'pacman' 'polkit')
optdepends=('yay: AUR support'
            'paru: Alternative AUR helper')
makedepends=('cmake' 'gcc' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"

    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
    cd "$pkgname-$pkgver/build"

    # Install binary
    install -Dm755 pacman-gui "$pkgdir/usr/bin/pacman-gui"

    # Install .desktop file
    install -Dm644 ../pacman-gui.desktop "$pkgdir/usr/share/applications/pacman-gui.desktop"

    # Install icon
    install -Dm644 ../icon-64.png "$pkgdir/usr/share/pixmaps/pacman-gui.png"
}
