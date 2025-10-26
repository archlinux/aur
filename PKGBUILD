# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-files
pkgver=2.7.5
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
sha256sums=('47136ca1f5326ab8ecebf072b405b6a83d9e17b4139e054eff9b1e7d23a11e56')

build() {
    cd elephant-${pkgver}/internal/providers/files
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/files
    install -Dm 755 files.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
