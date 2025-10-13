# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-clipboard
pkgver=2.1.7
pkgrel=1
pkgdesc='clipboard provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('wl-clipboard')
makedepends=('go')
conflicts=('elephant-clipboard')
provides=('elephant-clipboard')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69ee2229f70878d10dd84cb7acd4c996bde70b28f763db5fc152f53b36cc1f92')

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
