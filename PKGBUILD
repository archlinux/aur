# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-bitwarden
pkgver=2.20.2
pkgrel=1
pkgdesc='bitwarden provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
depends=('rbw')
conflicts=('elephant-bitwarden')
provides=('elephant-bitwarden')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f801cfdbdccf014a8237effc4ab90fe4f1d603bc507428cf80287e77e008dc52')

build() {
    cd elephant-${pkgver}/internal/providers/bitwarden
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/bitwarden
    install -Dm 755 bitwarden.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
