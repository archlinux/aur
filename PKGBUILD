# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-clipboard
pkgver=0.2.0
pkgrel=1
pkgdesc='clipboard provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('wl-clipboard' 'elephant')
makedepends=('go')
conflicts=('elephant-clipboard')
provides=('elephant-clipboard')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7fdbfb727839f8075a18db61af88057b1b91279031d4cca1554a737c2152578b')

build() {
    cd elephant-${pkgver}/internal/providers/clipboard
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/clipboard
    install -Dm 755 clipboard.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
