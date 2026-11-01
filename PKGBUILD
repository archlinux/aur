# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.

pkgname=qlinux-device-manager
pkgver=2.0.0
pkgrel=1
pkgdesc='Device manager and hardware information viewer for Linux, inspired by Windows Device Manager'
arch=('x86_64')
url='https://github.com/birdie-github/QLinuxDeviceManager'
license=('GPL-3.0-only')
depends=('qt6-base' 'systemd-libs' 'libv4l' 'xcb-util' 'wayland' 'libpulse')
optdepends=('qt6-base-dbus: cached UDisks2 storage metadata'
            'kmod: installed-module metadata and fallback driver names'
            'libdisplay-info: monitor EDID decoding'
            'qt6-tools: additional translation catalogs')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/birdie-github/QLinuxDeviceManager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0108726fd5dca59d7e217ee71e536eba8c69e5dbd822b81fc4ae92df64ea96b4')

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