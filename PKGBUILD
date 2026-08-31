# Maintainer: zefr0x <>

pkgname="edit0"
pkgver="0.6.1"
pkgrel=1
pkgdesc="run0edit - Script to edit a single file as root using run0"
arch=("any")
url="https://github.com/HastD/run0edit"
license=("MIT OR Apache-2.0")
depends=("systemd>=256")
makedepends=("meson" "pandoc-cli")
source=("run0edit-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("1c2095eacc864a86652297403958d279b4bb39711539a86845b3684fcd9518dedba6f57e41c0976aee286587376b4fea61b32780802abbc3893bba5d9e8ba765")

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
