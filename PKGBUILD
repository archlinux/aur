# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-snippets
pkgver=2.19.1
pkgrel=1
pkgdesc='snippets provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('wtype')
makedepends=('go')
conflicts=('elephant-snippets')
provides=('elephant-snippets')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("0d3aaac36c8a4a596c7c699dd32bcf45e47141f3497610a8ba655ffbcaf36e51")

build() {
    cd elephant-${pkgver}/internal/providers/snippets
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/snippets
    install -Dm 755 snippets.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
