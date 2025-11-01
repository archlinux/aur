# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-desktopapplications
pkgver=2.12.0
pkgrel=1
pkgdesc='desktopapplications provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-desktopapplications')
provides=('elephant-desktopapplications')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ca12d3712a7917f20d14313f690067edc1895dc8ff20ae315697b0da5ad8eeef')

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
