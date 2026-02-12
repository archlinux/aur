# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-symbols
pkgver=2.19.3
pkgrel=1
pkgdesc='symbols provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-symbols')
provides=('elephant-symbols')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92f6737a717ed489dc041ee377992214ef8d6b3641c1436376d05672c97fc01e')

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
