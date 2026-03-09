# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-symbols
pkgver=2.20.2
pkgrel=1
pkgdesc='symbols provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-symbols')
provides=('elephant-symbols')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f801cfdbdccf014a8237effc4ab90fe4f1d603bc507428cf80287e77e008dc52')

build() {
    cd elephant-${pkgver}/internal/providers/symbols
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/symbols
    install -Dm 755 symbols.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
