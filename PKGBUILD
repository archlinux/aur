# Maintainer: AndroidHyper <iuseopensusebtw@gmail.com>
pkgname=superinstall
pkgver=1.8
pkgrel=1
pkgdesc="A security-focused package manager alternative to paru and yay (C & Raylib Port - Source)"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/AndroidHyperOfficial/superinstall-aur-helper"
license=('GPL-3.0')
depends=('pacman' 'git' 'curl' 'gnupg' 'glibc' 'raylib' 'libx11')
makedepends=('gcc')
provides=('superinstall')
conflicts=('superinstall-bin')
options=(!debug !strip)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AndroidHyperOfficial/superinstall-aur-helper/archive/refs/tags/${pkgver}V.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "superinstall-aur-helper-${pkgver}V"
    mkdir -p build
}

build() {
    cd "superinstall-aur-helper-${pkgver}V"
    gcc main.c \
        backends/backends.c \
        backends/pacman.c \
        providers/providers.c \
        providers/aur.c \
        -o build/superinstall \
        -O3 \
        -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
}

package() {
    cd "superinstall-aur-helper-${pkgver}V"
    install -Dm755 build/superinstall "${pkgdir}/usr/bin/superinstall"
    install -Dm644 fonts/UbuntuMonoNerdFont-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/UbuntuMonoNerdFont-Regular.ttf"
}