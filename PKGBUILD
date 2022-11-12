# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=dropcode
pkgver=0.0.7
pkgrel=1
pkgdesc="A simple and lightweight code snippet manager."
arch=('x86_64')
url="https://github.com/egoist/dropcode"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
makedepends=('nodejs' 'pnpm' 'rust')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha512sums=('a741217f2c1a3025770b62928b8ee099de4715c038a2e98124ab1a31c57ef25e02a43adc4a28dc508fe0beff3077e9c71dd15f8e3bacf2084b570f4d6a75bc4b')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    pnpm i
    pnpm tauri build -b deb
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_amd64/data.tar.gz -C ${pkgdir}
}