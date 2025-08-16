# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-symbols
pkgver=1.0.0
pkgrel=1
pkgdesc='symbols provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-symbols')
provides=('elephant-symbols')
source=("${url}/archive/refs/tags/v${pkgver}-beta.tar.gz")
sha256sums=('7bad372e5796b882a7578a8ab36c7bb8921d135e4b960420136b7ba4a9ad186c')

build() {
    cd elephant-${pkgver}-beta/internal/providers/symbols
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta/internal/providers/symbols
    install -Dm 755 symbols.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
