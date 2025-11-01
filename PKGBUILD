# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-desktopapplications
pkgver=2.13.2
pkgrel=1
pkgdesc='desktopapplications provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-desktopapplications')
provides=('elephant-desktopapplications')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('251bcb2bfd2505ba2c373de92e956ded36e15de263ba138f3125def1f41b5b41')

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
