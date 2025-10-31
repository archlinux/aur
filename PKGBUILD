# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-nirisessions
pkgver=2.10.3
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
sha256sums=("c386135018507c21dd35fabfb4719663b2fb66423b3410867acda64b483f1236")

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
