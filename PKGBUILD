# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-playerctl
pkgver=2.21.0
pkgrel=1
pkgdesc='playerctl provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('playerctl')
makedepends=('go')
conflicts=('elephant-playerctl')
provides=('elephant-playerctl')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7631900b656511ccd3e82e832c4feaab3796f4e074e7829d91dd1bd2402f5c16")

build() {
    cd elephant-${pkgver}/internal/providers/playerctl
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/playerctl
    install -Dm 755 playerctl.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
