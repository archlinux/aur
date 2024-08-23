# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-gui-git"
_pkgname="customfetch"
pkgver=0.8.6.r2.fad7a19
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (with GUI mode)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('GPL3')
depends=('gtk3' 'gtkmm3')
makedepends=('base-devel')
optdepends=(
	"ttf-liberation: Font to be used for GUI (recommended)"
)
conflicts=('customfetch' 'customfetch-gui' "customfetch-git")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    make -C "${srcdir}/${_pkgname}" DEBUG=0 GUI_MODE=1
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}" PREFIX="/usr" DEBUG=0 GUI_MODE=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
