# Maintainer: Mina Maher <mina.maher88@hotmail.com>
pkgname=logitune
pkgver=0.3.2
pkgrel=1
pkgdesc="Logitech device configurator for Linux — per-app profiles, button remapping, DPI, gestures"
arch=('x86_64')
url="https://github.com/mmaher88/logitune"
license=('GPL-3.0-or-later')
install=logitune.install
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-5compat' 'systemd-libs')
makedepends=('cmake' 'ninja' 'qt6-tools')
optdepends=('gnome-shell: per-app profile switching on GNOME'
             'gnome-shell-extension-appindicator: tray icon on GNOME')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('33b07d278d8805804c67ab476d8d4ea2e471c3e69e2692203cd85422dcc536c3')

build() {
    cmake -B build -S "$pkgname-$pkgver" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
