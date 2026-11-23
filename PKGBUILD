# Maintainer: zefr0x <>

pkgname="edit0"
pkgver="0.7.2"
pkgrel=1
pkgdesc="run0edit - Script to edit a single file as root using run0"
arch=("any")
url="https://github.com/HastD/run0edit"
license=("MIT OR Apache-2.0")
depends=("systemd>=256" "python>=3.11")
makedepends=("meson" "pandoc-cli")
source=("run0edit-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("b325fa8c68bc47fbbefc238116506ea82170f31507624995fe84bf5d4c0b09f8d7e348aaf13f113e64a7759d48fdaddf531cf9700d37c0d16985fe18ffb6d0f4")

prepare() {
    cd "run0edit-${pkgver}"

    arch-meson build -Dunit-tests=disabled -Dintegration-tests=disabled
}

package() {
    cd "run0edit-${pkgver}"

    meson compile -C build
    meson install -C build --destdir "${pkgdir}"

    ln -s "${pkgdir}/usr/bin/run0edit" "${pkgdir}/usr/bin/edit0"
}
