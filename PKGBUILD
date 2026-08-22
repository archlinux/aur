# Maintainer: Riley Thompson <dhopcs@proton.me>
pkgname=gammactrl-git
pkgver=0.r6.dd8c9fc
pkgrel=1
pkgdesc="Gamma control for KDE Plasma Wayland sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/realdtn2/gammactrl"
license=('MIT')
depends=('gtk4' 'libkscreen' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'gcc')
options=(!debug)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/realdtn2/gammactrl.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
