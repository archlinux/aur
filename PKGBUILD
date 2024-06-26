# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-nogui-git"
_pkgname="customfetch"
pkgver=0.1.0
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (no GUI support)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('GPL3')
#depends=() # they are in the "base" meta-package anyway so basically no depends
makedepends=('base-devel')
#optdepends=() # still don't know
conflicts=('customfetch-git')
source=("git+${url}.git")
sha256sums=("SKIP")

#pkgver() {
#    cd "${srcdir}/${_pkgname}"
#    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
#}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0 GUI_SUPPORT=0
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr" DEBUG=0 GUI_SUPPORT=0
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
