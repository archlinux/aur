# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-archlinuxpkgs
pkgver=2.8.0
pkgrel=2
pkgdesc='archlinuxpkgs provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-archlinuxpkgs')
provides=('elephant-archlinuxpkgs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('232328f033b1a2eb21e24fb2063894bd0c1bea55943d05c0eb9705148e2441e4')

build() {
    cd elephant-${pkgver}/internal/providers/archlinuxpkgs
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/archlinuxpkgs
    install -Dm 755 archlinuxpkgs.so -t "${pkgdir}/etc/xdg/elephant/providers"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
