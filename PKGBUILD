# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-files
pkgver=2.19.2
pkgrel=1
pkgdesc='files provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('fd')
makedepends=('go')
conflicts=('elephant-files')
provides=('elephant-files')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e16d5c38eef311e15ce2635efa6f9b23179ba721eac7fdc055cf769b070b7bb')

build() {
    cd elephant-${pkgver}/internal/providers/files
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/files
    install -Dm 755 files.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
