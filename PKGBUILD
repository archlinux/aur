# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-git"
_pkgname="customfetch"
pkgver=0.10.1.r26.f3ccae3
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
#depends=() # some of them are in the "base" meta-package anyway so basically no extra depends
makedepends=('base-devel')
optdepends=(
	'wayland-client: Library for getting the Wayland compositor faster'
	'dconf: Alternative to the slow gsettings command'
	'libxfce4util: Query XFCE4 version faster'
)
conflicts=('customfetch-gui-git' 'customfetch-gui' 'customfetch' 'customfetch-bin' 'customfetch-gui-bin')
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0 GUI_MODE=0
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr" DEBUG=0 GUI_MODE=0
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
