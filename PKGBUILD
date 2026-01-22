# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-calc
pkgver=2.19.1
pkgrel=1
pkgdesc='calc provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('libqalculate')
makedepends=('go')
conflicts=('elephant-calc')
provides=('elephant-calc')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d3aaac36c8a4a596c7c699dd32bcf45e47141f3497610a8ba655ffbcaf36e51')

build() {
    cd elephant-${pkgver}/internal/providers/calc
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/calc
    install -Dm 755 calc.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
