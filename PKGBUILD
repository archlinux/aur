# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-calc
pkgver=1.0.0
pkgrel=11
pkgdesc='calc provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('libqalculate')
makedepends=('go')
conflicts=('elephant-calc')
provides=('elephant-calc')
source=("${url}/archive/refs/tags/v${pkgver}-beta-11.tar.gz")
sha256sums=('51ceb6339c87994b954f0a33d7ef636671b9d37e29a604b7e4dd6af7bb337115')

build() {
    cd elephant-${pkgver}-beta-11/internal/providers/calc
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-11/internal/providers/calc
    install -Dm 755 calc.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
