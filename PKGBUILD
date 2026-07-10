# Maintainer: zefr0x <>

pkgname="edit0"
pkgver="0.5.10"
pkgrel=1
pkgdesc="Script to edit a single file as root using run0"
arch=("any")
url="https://github.com/HastD/run0edit"
license=("MIT OR Apache-2.0")
depends=("systemd>=256")
makedepends=("meson" "pandoc-cli")
source=("run0edit-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("a5d60b5a42931220ac5362bc40d8da49d177e5026c330c002e1b5034a25d8c4d628b8a0d78ba824003fe7a3e0b51a0ff8cd324990dd71218f1abb9d6ee03932d")

prepare() {
    cd "run0edit-${pkgver}"

    arch-meson build -Dunit-tests=disabled -Dintegration-tests=disabled
}

package() {
    cd "run0edit-${pkgver}"

    meson compile -C build
    meson install -C build --destdir "${pkgdir}"
}
