# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui"
_pkgname="customfetch"
pkgver=0.10.1
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (with GUI mode)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
depends=('gtk3' 'gtkmm3')
optdepends=(
        "ttf-liberation: Font to be used for GUI (recommended)"
        "wayland-client: Library for getting the Wayland compositor faster"
        "dconf: Alternative to the slow gsettings command"
        "libxfce4util: Query XFCE4 version faster"
)
conflicts=('customfetch-gui-git' 'customfetch' 'customfetch-git' 'customfetch-bin')
makedepends=('base-devel')
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
