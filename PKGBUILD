# Maintainer: NodeRelay <joe@linuxdojo.org>
pkgname=uplink-irc-git
pkgver=2026.8.1.r1.g3e7be8b
pkgrel=1
pkgdesc="Fast, secure, IRCv3-featured IRC client (Qt6, development build)"
arch=('x86_64')
url="https://uplinkirc.chat"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'qt6-websockets' 'qtkeychain-qt6' 'tomlplusplus' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
provides=('uplink-irc')
conflicts=('uplink-irc')
source=("uplink-irc::git+https://github.com/noderelay/UplinkIRC.git")
sha256sums=('SKIP')

pkgver() {
    cd uplink-irc
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S uplink-irc \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUPLINK_VENDOR_DEPS=OFF \
        -DUPLINK_BUILD_TESTS=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
