# Maintainer: theguy147
pkgname=rmesg-git
pkgver=1.0.13.r10.gcc04d37
pkgrel=1
pkgdesc='A dmesg implementation in Rust. (git version)'
arch=('x86_64')
url="https://github.com/polyverse/rmesg"
license=('Apache')
makedepends=('rust')
source=("${pkgname}::git+https://github.com/polyverse/rmesg.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/rmesg
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
