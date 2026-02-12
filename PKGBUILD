# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-1password
pkgver=2.19.3
pkgrel=1
pkgdesc='1Password provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-1password')
provides=('elephant-1password')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92f6737a717ed489dc041ee377992214ef8d6b3641c1436376d05672c97fc01e')

build() {
    cd elephant-${pkgver}/internal/providers/1password
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/1password
    install -Dm 755 1password.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
