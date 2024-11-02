# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="customfetch-bin"
_pkgname="customfetch"
pkgver=0.10.1
pkgrel=1
pkgdesc="Highly customizable and fast system information fetch program (Binary files)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/customfetch"
license=('BSD-3-Clause')
#depends=() # some of them are in the "base" meta-package anyway so basically no extra depends
optdepends=(
        'wayland-client: Library for getting the Wayland compositor faster'
        'dconf: Alternative to the slow gsettings command'
        'libxfce4util: Query XFCE4 version faster'
)
conflicts=('customfetch-gui-git' 'customfetch-gui' 'customfetch-git' 'customfetch-gui-bin')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=("25d9211b82d52688452ec63b27a93a66065cc87aa9cce510fc3a4e93ec850d79")

package() {
    cd "${srcdir}/"
    install -Dm755 "cufetch" "${pkgdir}/usr/bin/cufetch"
    install -Dm644 "cufetch.1" "${pkgdir}/usr/share/man/man1/cufetch.1"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd assets/ && find ascii/ -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/customfetch/{}" \;
}
