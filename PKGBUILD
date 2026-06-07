pkgname=kloak-whonix
pkgver=0.8.5.1
pkgrel=1
pkgdesc="Anti keystroke deanonymization tool (Whonix)"
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

prepare() {
    cd kloak
    sed -i 's/\$(RONN)/true/g' Makefile || true
}

build() {
    cd kloak
    make all RONN=true
}

package() {
    cd kloak
    make DESTDIR="$pkgdir" install
}
