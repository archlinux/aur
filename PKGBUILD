# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Space Bunny Free.

pkgname=qlinux-device-manager
pkgver=1.3.0
pkgrel=1
pkgdesc='Device manager and hardware information viewer for Linux, inspired by Windows Device Manager'
arch=('x86_64')
url='https://github.com/birdie-github/QLinuxDeviceManager'
license=('GPL-3.0-only')
depends=('qt6-base' 'systemd-libs' 'libv4l' 'xcb-util' 'wayland')
optdepends=('qt6-base-dbus: cached UDisks2 storage metadata'
            'kmod: installed-module metadata and fallback driver names'
            'libdisplay-info: monitor EDID decoding'
            'qt6-tools: additional translation catalogs')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/birdie-github/QLinuxDeviceManager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7c9ebac38d0578d8e114d408e030a5fffaae29561128be4a274a7c93af7f51e')

build() {
    cmake -S "$srcdir/QLinuxDeviceManager-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$srcdir/QLinuxDeviceManager-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}