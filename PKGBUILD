# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-providerlist
pkgver=2.14.4
pkgrel=1
pkgdesc='providerlist provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-providerlist')
provides=('elephant-providerlist')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6ab46ad9defae8899a52b68ede37fbc42b3bd18293107c3b0fc58f7c876e83b6')

build() {
    cd elephant-${pkgver}/internal/providers/providerlist
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/providerlist
    install -Dm 755 providerlist.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
