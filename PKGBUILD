# Maintainer: Wojciech Kluczka <wojciech.kluczka@gmail.com>
pkgname=perceptia
pkgver=0.5.0
pkgrel=1
pkgdesc='Dynamic window manager with support for Wayland'
arch=('i686' 'x86_64')
url="https://github.com/perceptia/${pkgname}"
license=('MPL-2.0' 'MIT')
depends=('dbus' 'libdrm' 'libgl' 'libegl' 'udev' 'libxkbcommon')
makedepends=('rust' 'cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('012723663dd9adb8c52633d7c8b4d759')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --release --manifest-path ./perceptia/perceptia/Cargo.toml
    cargo build --release --manifest-path ./perceptia/perceptiactl/Cargo.toml
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/release/perceptia    "${pkgdir}/usr/bin/perceptia"
    install -Dm755 target/release/perceptiactl "${pkgdir}/usr/bin/perceptiactl"
}
