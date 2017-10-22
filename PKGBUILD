# Maintainer: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=hyperstart
pkgver=1.0.0
pkgrel=1
pkgdesc="Hypervisor-agnostic Docker Runtime (boot files)"
arch=('any')
url="https://www.hypercontainer.io/"
license=('Apache')
makedepends=('go')
optdepends=('hyperd: Hypervisor-agnostic Docker Runtime')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hyperhq/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d3d773bd707d0c9594352068f132381d54f49556897f6909d3c52f1d44ff7b4e')

build() {
    cd "${pkgname}-${pkgver}"

    ./autogen.sh
    ./configure --prefix=/usr --with-vbox
    make
}

package() {
    cd "${pkgname}-${pkgver}"

    install -D -m644 build/hyper-initrd.img    "${pkgdir}/var/lib/hyper/hyper-initrd.img"
    install    -m644 build/hyper-vbox-boot.iso "${pkgdir}/var/lib/hyper/hyper-vbox-boot.iso"
    install    -m644 build/kernel              "${pkgdir}/var/lib/hyper/kernel"
}
