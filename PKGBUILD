# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui"
_pkgname="customfetch"
pkgver=0.8.6
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('GPL3')
#depends=() # some of them are in the "base" meta-package anyway so basically no extra depends
makedepends=('base-devel')
conflicts=('customfetch-gui-git')
source=("git+${url}.git")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout "v${pkgver}"
}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0 GUI_MODE=1
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr" DEBUG=0 GUI_MODE=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
