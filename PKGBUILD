# Maintainer: Robiot <robiot#5485>

pkgname=rustcat
pkgver=0.0.4
pkgrel=1
pkgdesc="Rustcat - Like Netcat but in Rust"
url="https://github.com/robiot/rustcat"
license=('MIT')
arch=('x86_64')
makedepends=(
    'rustup'
)

source=("${pkgname}.tar.gz::https://github.com/robiot/rustcat/archive/refs/tags/v${pkgver}.tar.gz")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")

build() {
    rustup update stable
    cd "${srcdir}/rustcat-${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/rustcat-${pkgver}/target/release"
    install -d -m755 ${pkgdir}/usr/bin
    install -d -m755 ${pkgdir}/usr/share/${pkgname}
    cp -r . ${pkgdir}/usr/share/${pkgname}
    ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/rc
}
md5sums=('SKIP')