# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-websearch
pkgver=2.5.0
pkgrel=2
pkgdesc='websearch provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-websearch')
provides=('elephant-websearch')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('878e275e5dfe5dfca64c11b13ec7a565a0c81d165ccee2ec0940ffe538bf83f8')

build() {
    cd elephant-${pkgver}/internal/providers/websearch
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/websearch
    install -Dm 755 websearch.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
