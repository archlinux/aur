# Maintainer: Raphaël Slagmolen <tutul at naheulcraft dot be>
pkgname=plymouth-theme-manjaro-charge
pkgver=1.1
pkgrel=1
pkgdesc="A Plymouth theme based on Fedora's Charge theme, but featuring the Manjaro logo and colours."
arch=('any')
url='https://gitlab.com/Tutul/plymouth-theme-manjaro-charge'
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
backup=('usr/share/plymouth/themes/manjaro-charge/watermark.png')
source=(
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge.tar.gz"
    "https://gitlab.com/api/v4/projects/41563279/packages/generic/manjaro-charge/${pkgver}/manjaro-charge.tar.gz.sig"
)
sha256sums=(
    '76f2a03807aba290e989d6a07a1ec45b32f86976d374d79bfad68c038273f912'
    '47d10b1baadfe093a12f65d4e35e669df6507db6fa5b3dfd000ffd89442d2dd7'
)
validpgpkeys=('298358B59409045C6951F61ADC773C5B6D417714')

# Let you customize with one of the graphical environment logo provided
_selectedwatermark='default'
_providedwatermark=('default' 'budgie' 'cinnamon' 'gnome' 'i3' 'mate' 'plasma' 'sway' 'xfce')

prepare() {
    if [[ ! "${_providedwatermark[*]}" =~ "${_selectedwatermark}" ]]; then
        echo "The requested watermark (${_selectedwatermark}) isn't supported by this package"
        _selectedwatermark='default'
    fi
    tar -xf manjaro-charge.tar.gz
    cd "${srcdir}/manjaro-charge"
    ln -sf watermark-${_selectedwatermark}.png watermark.png
}

package() {
    cd "${srcdir}/manjaro-charge"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/manjaro-charge"
    install -Dm644 * "${pkgdir}/usr/share/plymouth/themes/manjaro-charge"
}
