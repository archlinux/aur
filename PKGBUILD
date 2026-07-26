# Maintainer: kotleni <kotleni@users.noreply.github.com>

pkgname=idlerd-git
pkgver=1.0.0.r0.gc2c92bf
pkgrel=1
pkgdesc='Configless idle management daemon for Wayland with gamepad support'
arch=('x86_64')
url="https://github.com/kotleni/${pkgname%-git}"
license=('GPL-2.0-only')
depends=('wayland')
makedepends=('cmake' 'wayland-protocols' 'wayland-utils' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
