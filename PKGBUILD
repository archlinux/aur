# Maintainer: Throdne <Throdne@gmail.com>

pkgname=supercell-wx-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A NEXRAD Level 2 and Level 3 radar viewing application (Stable Build)"
arch=('x86_64')
url="https://github.com/dpaulat/supercell-wx"
license=('MIT')
makedepends=()
depends=('xcb-util-cursor' 'mesa')
provides=('supercell-wx')
conflicts=('supercell-wx' 'supercell-wx-appimage')
source=("https://github.com/dpaulat/supercell-wx/releases/download/v${pkgver}-release/supercell-wx-v${pkgver}-linux-x64.tar.gz")
sha256sums=('ed86cdd17a692c67da7f9edb879588d6c5a88eb2c5e98b288b1b613a00fb96e0')

package() {
    # Extract the tar.gz file
    tar -xf "supercell-wx-v${pkgver}-linux-x64.tar.gz" -C "${srcdir}"

    # Check archive structure
    if [[ ! -d "${srcdir}/supercell-wx/bin" ]]; then
        error "Unexpected archive structure."
        return 1
    fi

    # Install to /opt
    install -dm755 "${pkgdir}/opt/supercell-wx"
    cp -a "${srcdir}/supercell-wx/"* "${pkgdir}/opt/supercell-wx/"

    # Symlink binary to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/supercell-wx/bin/supercell-wx" "${pkgdir}/usr/bin/supercell-wx"
}
