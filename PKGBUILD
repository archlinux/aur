# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-windows
pkgver=2.7.9
pkgrel=1
pkgdesc='windows provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('fd')
makedepends=('go')
conflicts=('elephant-windows')
provides=('elephant-windows')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('933594ba4a9a265f4e53e0c8ced6fd10e69d0bdbd8ca7cc238730e50694cae7c')

build() {
    cd elephant-${pkgver}/internal/providers/windows
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/windows
    install -Dm 755 windows.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
