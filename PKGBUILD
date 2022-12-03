# Maintainer: Raphaël Slagmolen <tutul at naheulcraft dot be>
pkgname=plymouth-theme-manjaro-charge
pkgver=1.0
pkgrel=2
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
    'bfd15f3d870543552c60a080846d31e45dbf518a50bfe86f656a5603f2998dfb'
    'b0a82080597122a8e9bccbcb6de6b63a4c122eb23c8ec9230d97c3b1f32b5ce8'
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
