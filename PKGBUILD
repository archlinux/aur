pkgname=kloak-whonix
pkgver=0.8.5.1
pkgrel=1
pkgdesc="Kloak is a privacy tool (input device anonymization tool) that hides your typing and mouse movement patterns, which can be used to identify you online."
arch=('x86_64')
url="https://github.com/Whonix/kloak"
license=('GPL2')
provides=('kloak')
conflicts=('kloak-git')
depends=('libevdev' 'libinput' 'wayland' 'libxkbcommon' 'systemd-libs')
makedepends=('make' 'pkg-config' 'git')
source=('kloak::git+https://github.com/Whonix/kloak.git')
sha256sums=('SKIP')

pkgver() {
    cd kloak
    git describe --tags --abbrev=0 | sed 's/-\([0-9]*\)$/.\1/' | sed 's/^v//'
}

build() {
    cd kloak
    make kloak
}

package() {
    cd kloak
    install -Dm755 kloak "$pkgdir/usr/bin/kloak"
    install -Dm644 etc/apparmor.d/usr.bin.kloak "$pkgdir/etc/apparmor.d/usr.bin.kloak"
}
