# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui-git"
_pkgname="customfetch"
pkgver=0.10.2.r0.bc3769d
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (GUI app)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
depends=('gtk3' 'gtkmm3')
makedepends=('base-devel')
optdepends=(
        "ttf-liberation: Font to be used for GUI (recommended)"
        "wayland: Library for getting the Wayland compositor faster"
        "dconf: Alternative to the slow gsettings command"
        "libxfce4util: Query XFCE4 version faster"
)
conflicts=('customfetch' 'customfetch-gui' 'customfetch-git' 'customfetch-bin' 'customfetch-gui-bin')
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
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr" DEBUG=0 GUI_APP=1
}
