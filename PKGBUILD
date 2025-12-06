# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-websearch
pkgver=2.17.0
pkgrel=1
pkgdesc='websearch provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-websearch')
provides=('elephant-websearch')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f28a39d4eea2447d7fc5b2651ebd0cf91b3e141064690ec2cc259af1764459e')

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
