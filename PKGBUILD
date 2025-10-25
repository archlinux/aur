# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-nirisessions
pkgver=2.7.1
pkgrel=1
pkgdesc='nirisessions provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('niri')
makedepends=('go')
conflicts=('elephant-nirisessions')
provides=('elephant-nirisessions')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("68f83e5a808ad363a5ddf1754e60d5b71a60c8a9ad406b407ccb863104962d78")

build() {
    cd elephant-${pkgver}/internal/providers/nirisessions
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/nirisessions
    install -Dm 755 nirisessions.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
