# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-calc
pkgver=1.0.0
pkgrel=10
pkgdesc='calc provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libqalculate')
makedepends=('go')
conflicts=('elephant-calc')
provides=('elephant-calc')
source=("${url}/archive/refs/tags/v${pkgver}-beta-10.tar.gz")
sha256sums=('0902a199fc93fc15cc0bb852b21da129dffeed1513d80cafc98d1d4b1a845618')

build() {
    cd elephant-${pkgver}-beta-10/internal/providers/calc
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-10/internal/providers/calc
    install -Dm 755 calc.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
