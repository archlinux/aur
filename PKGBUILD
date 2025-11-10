# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-1password
pkgver=2.15.0
pkgrel=1
pkgdesc='1Password provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-1password')
provides=('elephant-1password')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e1a7cd44ed943475129dcd21160056d1fd4dc33dd968e6ff462cc88fa424d2bd')

build() {
    cd elephant-${pkgver}/internal/providers/1password
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/1password
    install -Dm 755 1password.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
