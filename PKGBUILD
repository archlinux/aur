# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-clipboard
pkgver=1.0.0
pkgrel=15
pkgdesc='clipboard provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('wl-clipboard')
makedepends=('go')
conflicts=('elephant-clipboard')
provides=('elephant-clipboard')
source=("${url}/archive/refs/tags/v${pkgver}-beta-15.tar.gz")
sha256sums=('b7eb215e35306d4c19de454a419b04aa4a72d081bef6530552637c087fa7acb8')

build() {
    cd elephant-${pkgver}-beta-15/internal/providers/clipboard
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-15/internal/providers/clipboard
    install -Dm 755 clipboard.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
