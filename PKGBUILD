# Maintainer: bytesketch
pkgname=lpack-git
pkgver=1.0_beta
pkgrel=1
pkgdesc="A lightweight Linux packaging system and portable package manager for distributing applications across distributions using a standard .lpk format"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/bytesketch/lpack.git"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("lpack")
conflicts=("lpack")
source=("lpack::git+https://github.com/bytesketch/lpack.git")
sha256sums=('SKIP')
options=('!debug')
pkgver() {
    cd "${srcdir}/lpack"
    ZSTD_SYS_USE_PKG_CONFIG=0 cargo build --release --target-dir=target >/dev/null 2>&1
    ./target/release/lpack --version | awk '{print $2}' | tr -d 'v' | tr '-' '_'
}
build() {
    true
}
package() {
    cd "${srcdir}/lpack"
    install -Dm755 "target/release/lpack" "${pkgdir}/usr/bin/lpack"
}
