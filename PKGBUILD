# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-runner
pkgver=2.11.0
pkgrel=1
pkgdesc='runner provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-runner')
provides=('elephant-runner')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0548d9e8c82392422b8b1d8d5b75841d3301d0c04977a33be8b113cd8d87a705')

build() {
    cd elephant-${pkgver}/internal/providers/runner
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/runner
    install -Dm 755 runner.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
