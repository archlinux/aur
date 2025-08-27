# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-clipboard
pkgver=1.0.0
pkgrel=7
pkgdesc='clipboard provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('wl-clipboard')
makedepends=('go')
conflicts=('elephant-clipboard')
provides=('elephant-clipboard')
source=("${url}/archive/refs/tags/v${pkgver}-beta-7.tar.gz")
sha256sums=('2b0878fd386213aa5351ccdc8dbb46f59893b20008ecb23db0de18345c9f182c')

build() {
    cd elephant-${pkgver}-beta-7/internal/providers/clipboard
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-7/internal/providers/clipboard
    install -Dm 755 clipboard.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
