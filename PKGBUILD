# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-archlinuxpkgs
pkgver=1.0.0
pkgrel=23
pkgdesc='archlinuxpkgs provider for elephant'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go')
conflicts=('elephant-archlinuxpkgs')
provides=('elephant-archlinuxpkgs')
source=("${url}/archive/refs/tags/v${pkgver}-beta-23.tar.gz")
sha256sums=('7496af78c6a535a6410abc9f712a7e9331908a7055bdb42335b653aa9acefdbd')

build() {
    cd elephant-${pkgver}-beta-23/internal/providers/archlinuxpkgs
    go build -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}-beta-23/internal/providers/archlinuxpkgs
    install -Dm 755 archlinuxpkgs.so -t "${pkgdir}/etc/xdg/elephant/providers"
}
