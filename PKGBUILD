# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-menus
pkgver=2.7.3
pkgrel=1
pkgdesc='menus provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-menus')
provides=('elephant-menus')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0d94484016be37fd067575e341590db94ac7e2c1d185e06b909c50556271cb14')

build() {
    cd elephant-${pkgver}/internal/providers/menus
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/menus
    install -Dm 755 menus.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
