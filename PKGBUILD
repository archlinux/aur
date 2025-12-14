# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-menus
pkgver=2.17.2
pkgrel=2
pkgdesc='menus provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-menus')
provides=('elephant-menus')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b026d227eec81bd6d816684a41a894e65d5daded10aa20fb5e9e46c73f7f1206')

build() {
    cd elephant-${pkgver}/internal/providers/menus
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/menus
    install -Dm 755 menus.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
