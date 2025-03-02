# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch"
_pkgname="customfetch"
pkgver=1.0.0
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
depends=('customfetch-common') # some of them are in the "base" meta-package anyway so basically no extra depends
makedepends=('base-devel')
optdepends=(
        'wayland: Library for getting the Wayland compositor faster'
        'dconf: Alternative to the slow gsettings command'
        'libxfce4util: Query XFCE4 version faster'
)
conflicts=('customfetch-git' 'customfetch-bin')
source=("git+${url}.git")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout "tags/v${pkgver}"
}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0 GUI_APP=1
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/${_pkgname}"
    mv ./build/release/customfetch-gui "${pkgdir}/usr/bin"
}
