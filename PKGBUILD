# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-calc
pkgver=2.7.8
pkgrel=1
pkgdesc='calc provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('libqalculate')
makedepends=('go')
conflicts=('elephant-calc')
provides=('elephant-calc')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f53b6e0c56e320010fdba67dff07173a70e5c7d8d032c960436e1d8db76c5fa9')

build() {
    cd elephant-${pkgver}/internal/providers/calc
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/calc
    install -Dm 755 calc.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
