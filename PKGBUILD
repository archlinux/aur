# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-archlinuxpkgs
pkgver=2.10.1
pkgrel=1
pkgdesc='archlinuxpkgs provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('go')
conflicts=('elephant-archlinuxpkgs')
provides=('elephant-archlinuxpkgs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d02d231e2c76b2e44de3eefb7583c336f679916999dc6be35cfc2d13337029b')

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
