# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui-git"
_pkgname="customfetch"
pkgver=1.0.0.r0.369dacc
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (GUI app) (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
depends=('gtk3' 'gtkmm3' 'customfetch-common-git')
makedepends=('base-devel')
optdepends=(
        "ttf-liberation: Font to be used for GUI (recommended)"
        "wayland: Library for getting the Wayland compositor faster"
        "dconf: Alternative to the slow gsettings command"
        "libxfce4util: Query XFCE4 version faster"
)
conflicts=('customfetch-gui' 'customfetch-gui-bin')
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0 GUI_APP=1
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/application"
    cd "${srcdir}/${_pkgname}"
    mv ./build/release/customfetch-gui "${pkgdir}/usr/bin"
    mv ./customfetch.desktop "${pkgdir}/usr/share/application"
}
