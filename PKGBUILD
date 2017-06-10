# Maintainer: Wojciech Kluczka <wojciech.kluczka@gmail.com>
pkgname=perceptia-git
pkgver=0.5.0.r0.g5710c8f
pkgrel=1
pkgdesc='Dynamic window manager with support for Wayland'
arch=('i686' 'x86_64')
url="https://github.com/perceptia/${pkgname%-git}"
license=('MPL-2.0' 'MIT')
depends=('dbus' 'libdrm' 'libgl' 'libegl' 'udev' 'libxkbcommon')
makedepends=('git' 'rust' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    cargo build --release --manifest-path ./perceptia/perceptia/Cargo.toml
    cargo build --release --manifest-path ./perceptia/perceptiactl/Cargo.toml
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm755 target/release/perceptia    "${pkgdir}/usr/bin/perceptia"
    install -Dm755 target/release/perceptiactl "${pkgdir}/usr/bin/perceptiactl"
}
