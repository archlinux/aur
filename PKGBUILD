# Maintainer: desbma
pkgname=motd
pkgver=1.1.3
pkgrel=2
pkgdesc='Dynamically generate system information for MOTD SSH banner'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
optdepends=('hddtemp: to probe hard drive temperatures'
            'systemd: to display failed units')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1c32e75e91813b1ac541fa29c0a8fa52d726f2d051d4abac03d06f9a7dd985ada856f4d23bea32ce0c07d8ae82569307e193c7b3384ec129912c39f529ee8126')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
