# Maintainer: Wojciech Kluczka <wojciech.kluczka@gmail.com>
pkgname=perceptia
pkgver=0.1.0.r4.g7816c6f
pkgrel=1
pkgdesc='Dynamic window manager with support for Wayland'
arch=('i686' 'x86_64')
url="https://github.com/perceptia/${pkgname}"
license=('MPL-2.0' 'MIT')
depends=('dbus' 'libdrm' 'libgl' 'libegl' 'udev' 'libxkbcommon')
makedepends=('git' 'rust' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

    cargo build --release --manifest-path ./src/perceptia/Cargo.toml
    cargo build --release --manifest-path ./src/perceptiactl/Cargo.toml
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 target/release/perceptia    "${pkgdir}/usr/bin/perceptia"
    install -Dm755 target/release/perceptiactl "${pkgdir}/usr/bin/perceptiactl"
}
