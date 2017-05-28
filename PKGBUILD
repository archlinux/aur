# Maintainer: Wojciech Kluczka <wojciech.kluczka@gmail.com>
pkgname=perceptia
pkgver=0.4.0
pkgrel=1
pkgdesc='Dynamic window manager with support for Wayland'
arch=('i686' 'x86_64')
url="https://github.com/perceptia/${pkgname}"
license=('MPL-2.0' 'MIT')
depends=('dbus' 'libdrm' 'libgl' 'libegl' 'udev' 'libxkbcommon')
makedepends=('rust' 'cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('34c261ce7ec6162e9ee3f91810f93e74')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --release --manifest-path ./src/perceptia/Cargo.toml
    cargo build --release --manifest-path ./src/perceptiactl/Cargo.toml
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/release/perceptia    "${pkgdir}/usr/bin/perceptia"
    install -Dm755 target/release/perceptiactl "${pkgdir}/usr/bin/perceptiactl"
}
