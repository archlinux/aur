# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-clipboard
pkgver=2.10.4
pkgrel=1
pkgdesc='clipboard provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('wl-clipboard' 'imagemagick')
makedepends=('go')
conflicts=('elephant-clipboard')
provides=('elephant-clipboard')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a2f13ae26c5c6d16dc34abdcb4cf51cea18987c0156e3bc22f13d48764bcb99')

build() {
    cd elephant-${pkgver}/internal/providers/clipboard
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/clipboard
    install -Dm 755 clipboard.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
