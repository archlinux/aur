# Maintainer: Yann Jorelle <yannjorelle@protonmail.com>
# Credits: @ChewingBever https://github.com/ChewingBever for creating this script
pkgbase='krabby-git'
pkgname='krabby-git'
pkgver=0.1.6.r0.g2669909
pkgrel=1
pkgdesc='Print pokemon sprites in your terminal (development version)'
arch=('x86_64')
url='https://github.com/yannjor/krabby'
license=('GPL-3.0')
makedepends=('git' 'rust')
conflicts=('krabby')
source=("${pkgname}::git+https://github.com/yannjor/krabby#branch=main")
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    install -Dm755 "${pkgname}/target/release/krabby" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
