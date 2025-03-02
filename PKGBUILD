# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-git"
_pkgname="customfetch"
pkgver=1.0.0.r0.369dacc
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
depends=('customfetch-common-git') # some of them are in the "base" meta-package anyway so basically no extra depends
makedepends=('base-devel')
optdepends=(
	'wayland: Library for getting the Wayland compositor faster'
	'dconf: Alternative to the slow gsettings command'
	'libxfce4util: Query XFCE4 version faster'
)
conflicts=('customfetch' 'customfetch-bin')
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0 GUI_APP=0
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/${_pkgname}"
    mv ./build/release/customfetch ./build/release/cufetch "${pkgdir}/usr/bin"
}
