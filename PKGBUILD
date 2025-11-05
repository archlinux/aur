# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-desktopapplications
pkgver=2.14.2
pkgrel=1
pkgdesc='desktopapplications provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-desktopapplications')
provides=('elephant-desktopapplications')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1fa1b4f398d90a0cb89e130f50a68cc4df3c9c303f856a4ec1047cc43fe19daf')

build() {
    cd elephant-${pkgver}/internal/providers/desktopapplications
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/desktopapplications
    install -Dm 755 desktopapplications.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
